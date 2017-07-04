require 'rails_helper'

describe Product do
  it "has a valid factory" do
    expect(create :product).to be_valid
  end

  it "is invalid without title" do
    expect(build :product, title: nil).not_to be_valid
  end

  it "has unique title" do
    expect(create :product, title: "Steam Latin").to be_valid
    expect(build :product, title: "Steam Latin").not_to be_valid
  end

  it "has title longer than 3 signs" do
    expect(build :product, title: "AB").not_to be_valid
    expect(build :product, title: "ABC").to be_valid
  end

  it "is invalid without description" do
    expect(build :product, description: nil).not_to be_valid
  end

  it "is invalid without image url" do
    expect(build :product, image_url: nil).not_to be_valid
  end

  it "has proper file extension in image url" do
    expect(build :product, image_url: "lorem.jpg").to be_valid
    expect(build :product, image_url: "lorem.gif").to be_valid
    expect(build :product, image_url: "lorem.exe").not_to be_valid
  end

  it "is invalid without price" do
    expect(build :product, price: nil).not_to be_valid
  end

  it "has price greater than 0" do
    expect(build :product, price: 0.1).to be_valid
    expect(build :product, price: 0).not_to be_valid
    expect(build :product, price: -5).not_to be_valid
  end

  it "returns product updated latest" do
    lorem = create :product
    steam = create :product, title: "Steam engine"
    expect(Product.latest.title).to eq(steam.title)
    lorem.title = "ABC"
    lorem.save
    expect(Product.latest.title).to eq(lorem.title)
  end

  it "can not be destroyed if has any line items" do
    a = create :line_item
    p = create :product
    p.line_items << a
    p.save
    expect(Product.count).to eq(1)
    p.delete
    expect(Product.count).to eq(1)
  end
end
