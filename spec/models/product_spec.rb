require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
      it "is valid" do
        product = Product.new(name: "Bob", price: 300, quantity: 4, category_id: 0, category: Category.new)
        expect(product).to be_valid
      end
    describe 'name' do

    end
  end
end
