class Copy < ActiveRecord::Base
  belongs_to :book
  has_many :statuses, inverse_of: :copy

  validates :copy_number, presence: true, numericality: true

  validates :book, presence: true

  def availability?
    self.statuses.each do |status|
      if status.unavailable?
        return false
      end
    end
    return true
  end  
end

#need to write validation for: it has a unique copy_number within the scope of the other copies that belong to a specfic book