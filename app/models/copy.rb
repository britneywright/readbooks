class Copy < ActiveRecord::Base
  belongs_to :book
  has_many :statuses, inverse_of: :copy

  validates :copy_number, presence: true, numericality: true

  validates :book, presence: true
end
