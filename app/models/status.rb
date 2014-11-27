class Status < ActiveRecord::Base
  belongs_to :book
  belongs_to :copy

  validates :borrower_name, :borrower_email, :borrower_phone, :copy, :book, presence: true

  validates :checked_out, presence: true, if: :checked_in?

  validate :checked_in_after_checked_out

  def checked_in_after_checked_out
    if checked_out? && checked_in? && checked_out > checked_in
      errors.add(:checked_in, "date can't be before check out date")
    end
  end

end

# validate proper email format
# validate proper phone number format