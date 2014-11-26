require 'rails_helper'

describe Copy do

  it "is valid" do
    expect(build(:copy)).to be_valid
  end

  it "belongs to a book" do
    something = create(:book)
    expect(build(:copy).book).to be something
  end
end