FactoryGirl.define do
  factory :copy do
    sequence(:copy_number) {|n| n}
    book
    availability true
  end
end