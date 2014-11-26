class Book < ActiveRecord::Base
  has_many :statuses, :through => :copies
  has_many :copies
  validates :title, :year, presence: true
  validates :year, format: { with: /\A\d{4}$\z/, message: "only allow numbers" }

  has_attached_file :cover_image
  validates_attachment_content_type :cover_image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
