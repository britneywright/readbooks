require 'rails_helper'

describe Status do

  it "is valid" do
    expect(build(:status)).to be_valid
  end

  it "belongs to a specific copy of a specific book" do
    book_a = create(:book)
    copy_a = create(:copy)
    expect(build(:status, copy: copy_a).copy).to be copy_a
    expect(build(:status, book: book_a).book).to be book_a
  end

  it "is checked in after it's been checked out" do
    expect(build(:status, checked_out: "2014-10-27", checked_in: "2014-11-27")).to be_valid
  end

  it "can't be checked in unless it's been checked out" do
    expect(build(:status, checked_in: "2014-10-27")).to be_invalid
  end

  it "can't be checked in before it's been checked out" do
    expect(build(:status, checked_out: "2014-11-27", checked_in: "2014-10-27")).to be_invalid
  end
end