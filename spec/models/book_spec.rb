require 'rails_helper'

describe Book do

  it "is valid" do
    expect(build(:book)).to be_valid
  end

  it "has a title" do
    expect(build(:book)).to be_valid
  end

  it "has a valid year with four digits" do
    expect(build(:book)).to be_valid
  end

  it "is invalid without a four digit year" do
    book = build(:book, year: "2434butter")
    expect(book).to be_invalid
  end

  # it "has a cover image" do
  #   expect(build(:book)).to be_valid
  # end

  # it "has a valid cover image address that ends in jpg or png" do
  #   book = build(:book, copies: "74 copoes")
  #   expect(book).to be_invalid
  # end

  # it "is invalid if cover image address doesn't end in jpg or png" do
  #   book = build(:book, cover_image: "http://something.com")
  #   expect(book).to be_invalid
  # end
end
