require 'rails_helper'

describe Book do

  it "is valid" do
    expect(build(:book)).to be_valid
  end

  it "in invalid without a title" do
    expect(build(:book, title: nil)).to be_invalid
  end

  it "is invalid without a four digit year" do
    expect(build(:book, year: "2434butter")).to be_invalid
  end

  context "when link is added" do
    it "is invalid without a proper link" do
      expect(build(:book, link: "2434butter")).to be_invalid
    end

    it "is valid if it begins with http://" do
      expect(build(:book, link: "http://example.com")).to be_valid
    end

    it "is valid if it begins with https://" do
      expect(build(:book, link: "https://example.com")).to be_valid
    end
  end

  it "has a valid cover image" do
    expect(build(:book, cover_image_file_name: "soemthing.jpg")).to be_valid
  end
end
