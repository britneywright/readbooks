class Book < ActiveRecord::Base
  has_many :statuses, :through => :copies
  has_many :copies, inverse_of: :book
  validates :title, :year, :author, presence: true
  validates :year, format: { with: /\A\d{4}$\z/, message: "only allow numbers" }

  validates :link, format: {with: /\A(http:\/\/)|\A(https:\/\/)/, message: "must be a valid url"}, unless: "link.nil?"

  has_attached_file :cover_image
  validates_attachment_content_type :cover_image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def available
    self.copies.each do |copy|
      if copy.availability?
        return true
      end
    end
    return false
  end  
end