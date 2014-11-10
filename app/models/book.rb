class Book < ActiveRecord::Base
  validates :title, :copies, :year, presence: true
  validates :year, format: { with: /\A\d{4}$\z/, message: "only allow numbers" }
  validates :copies, format: { with: /\A\d+\z/, message: "only allow numbers"}
  validates :cover_image, format: { with: %r{\.((jpg)||(gif)||(png))\Z}i, message: 'must be a URL for GIF image'}
end
