require 'rails_helper'

describe Copy do

  it "is valid" do
    expect(build(:copy)).to be_valid
  end

  it "is invalid without a copy_number" do
    expect(build(:copy, copy_number: nil)).to be_invalid
  end

  it "is invalid if copy_number is not an integer" do
    expect(build(:copy, copy_number: "food")).to be_invalid
  end

  it "belongs to a book" do
    something = create(:book)
    expect(build(:copy, book: something).book).to be something
  end
end