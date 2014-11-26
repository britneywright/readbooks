FactoryGirl.define do
  factory :status do
    borrower_name "Jane Dog"
    borrower_email "jane@example.com"
    borrower_phone "5202508037"
    checked_out "2014-11-25"
    checked_in "2014-11-27"
  end
end