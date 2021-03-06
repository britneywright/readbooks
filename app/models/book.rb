class Book < ActiveRecord::Base
  attr_accessor :initial_copies
  has_many :copies, :inverse_of => :book, dependent: :destroy
  has_many :statuses, :inverse_of => :book
  validates :title, :year, :author, presence: true
  validates :year, format: { with: /\A\d{4}$\z/, message: "only allow numbers" }

  validates :link, format: {with: /\A(http:\/\/)|\A(https:\/\/)/, message: "must be a valid url"}, unless: "link.nil?"

  has_attached_file :cover_image,
                    :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials},
                    :s3_host_name => 's3-us-west-2.amazonaws.com'

  validates_attachment_content_type :cover_image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  before_create :add_copies

  before_save :set_slug

  def set_slug
    self.slug = title.parameterize unless title.blank?
  end

  def to_param
    slug
  end

  def available
    self.copies.where(availability: true).count > 0
  end

  def s3_credentials
    {:bucket => ENV['bucket'], :access_key_id => ENV['access_key_id'], :secret_access_key => ENV['secret_access_key']}
  end

  private

  def add_copies
    initial_copies.to_i.times {|i|
     copies.build(copy_number: i.next)
   }
  end

end