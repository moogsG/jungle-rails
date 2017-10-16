require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
      it "is valid" do
        product = Product.new(name: "Bob", price: 300, quantity: 4, category_id: 0, category: Category.new)
        expect(product).to be_valid
      end
    describe 'Valid name' do
      it "name is not valid" do
        product = Product.new(price: 300, quantity: 4, category_id: 0, category: Category.new)
        expect(product).to_not be_valid
        expect(product.errors.messages[:name]).to include('can\'t be blank')
      end
    end
    describe 'Valid price' do
      it "price is not valid" do
        product = Product.new(name: "Bob", quantity: 4, category_id: 0, category: Category.new)
        expect(product).to_not be_valid
        expect(product.errors.messages[:price]).to include('can\'t be blank')
      end
    end
    describe 'Valid quantity' do
      it "quantity is not valid" do
        product = Product.new(price: 300, name: "Bob", category_id: 0, category: Category.new)
        expect(product).to_not be_valid
        expect(product.errors.messages[:quantity]).to include('can\'t be blank')
      end
    end
    describe 'Valid category' do
      it "category is not valid" do
        product = Product.new(price: 300, quantity: 4, category_id: 0, name: "Bob")
        expect(product).to_not be_valid
        expect(product.errors.messages[:category]).to include('can\'t be blank')
      end
    end
  end
end
