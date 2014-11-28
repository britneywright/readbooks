FactoryGirl.define do
  factory :book do
    title { Faker::Company.name }
    author { Faker::Name.name }
    year "2014"
    after(:build) do |book|
      book.copies << FactoryGirl.build(:copy, 
        book: book)
    end
  end
end