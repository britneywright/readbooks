class Copy < ActiveRecord::Base
  belongs_to :book
  has_many :statuses
end
