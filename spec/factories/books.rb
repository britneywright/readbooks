# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :book do
    title "Effective Ruby"
    copies "2"
    year "2014"
  end
end
