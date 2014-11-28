class Copy < ActiveRecord::Base
  belongs_to :book, :inverse_of => :copies
  has_many :statuses, :inverse_of => :copy

  validates :copy_number, presence: true, numericality: true

  validates :book, presence: true

  after_save :update_copy

  def update_copy
    if availability == nil
      update_attributes!(availability: true)
    end      
  end

  def copy_availability
    "#{copy_number}: #{availability}"
  end
end
#need to write validation for: it has a unique copy_number within the scope of the other copies that belong to a specfic book