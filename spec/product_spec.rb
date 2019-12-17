require 'rails_helper'
 
RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "a valid name" do
      @category = Category.new(name: "Category")
      @product = Product.new(name: "Product" ,description: "Test", price_cents: 100, :category => @category, quantity: 1)
      @product.name = "Product"
    end
    it "a valid price" do
      @category = Category.new(name: "Category")
      @product = Product.new(name: "Product" ,description: "Test", price_cents: 100, :category => @category, quantity: 1)
      @product.price_cents = 100
    end
    it "a valid quantity" do
      @category = Category.new(name: "Category")
      @product = Product.new(name: "Product" ,description: "Test", price_cents: 100, :category => @category, quantity: 1)
      @product.quantity = 1
    end
    it "a valid category" do
      @category = Category.new(name: "Category")
      @product = Product.new(name: "Product" ,description: "Test", price_cents: 100, :category => @category, quantity: 1)
      @product.category = @category
    end
    it "successfully saves" do
      @category = Category.new(name: "Category")
      @product = Product.new(name: "Product" ,description: "Test", price_cents: 100, :category => @category, quantity: 1)
      @product.save!
      expect(@product.id).to be_present
    end
    it "errors when name is nil" do
      @category = Category.create(name: "Category")
      @product = Product.create(name: nil, description: "Test", price_cents: 100, :category => @category, quantity: 1)
      expect(@product.errors.full_messages).to eq(["Name can't be blank"])
    end
    it "errors when price is nil" do
      @category = Category.create(name: "Category")
      @product = Product.create(name: "Product", description: "Test", price_cents: nil, :category => @category, quantity: 1)
      expect(@product.errors.full_messages).to eq(["Price cents is not a number", "Price is not a number", "Price can't be blank"])
    end
    it "errors when quantity is nil" do
      @category = Category.create(name: "Category")
      @product = Product.create(name: "Product", description: "Test", price_cents: 100, :category => @category, quantity: nil)
      expect(@product.errors.full_messages).to eq(["Quantity can't be blank"])
    end
    it "errors when category is nil" do
      @category = Category.create(name: "Category")
      @product = Product.create(name: "Product", description: "Test", price_cents: 100, :category => nil, quantity: 1)
      expect(@product.errors.full_messages).to eq(["Category can't be blank"])
    end
  end
end