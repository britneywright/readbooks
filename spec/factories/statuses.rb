FactoryGirl.define do
  factory :status do
    borrower_name "Jane Dog"
    borrower_email "jane@example.com"
    borrower_phone "5202508037"
    book
    copy
  end
end