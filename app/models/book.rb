class Book < ActiveRecord::Base
  validates :title, :copies, :year, presence: true
  validates :year, format: { with: /\A\d{4}$\z/, message: "only allow numbers" }
  validates :copies, format: { with: /\A\d+\z/, message: "only allow numbers"}

  has_attached_file :cover_image
  validates_attachment_content_type :cover_image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
