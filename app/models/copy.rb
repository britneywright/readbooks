class Copy < ActiveRecord::Base
  belongs_to :book
  has_many :statuses

  validates :copy_number, presence: true, numericality: true

  validates_associated :book
end
