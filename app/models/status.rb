class Status < ActiveRecord::Base
  belongs_to :copy, :inverse_of => :statuses
  belongs_to :book, :inverse_of => :statuses

  validates :borrower_name, :borrower_email, :borrower_phone, presence: true

  validates :checked_out, presence: true, if: :checked_in?

  validates :copy, presence: true, if: :checked_out?

  validate :checked_in_after_checked_out

  after_update :update_copy

  def update_copy
    if copy_id && checked_out? && !checked_in?
      copy.update_attributes!(availability: false)
    elsif copy_id
      copy.update_attributes!(availability: true)
    end      
  end

  def checked_in_after_checked_out
    if checked_out? && checked_in? && checked_out > checked_in
      errors.add(:checked_in, "date can't be before check out date")
    end
  end

  def confirmation_emails
  end 
end

# validate proper email format
# validate proper phone number format
# can't check out a copy that's already checked out