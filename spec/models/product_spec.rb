require 'rails_helper'

RSpec.describe Product, type: :model do
  # before   do 
  #   @product = Product.new
  describe 'validations' do
    it 'should save' do
      @category = Category.new(name: "great")
      @category.save!
      @product = Product.new(name:'name', price:'1000', quantity: 30, category: @category)
      @product.save!
      expect(@product.id).to be_present    
    end

    it 'should have a name' do
       @category = Category.new(name: "great")
       @category.save!
       @product = Product.new(name: nil , price:'1000', quantity: 30, category: @category)
       @product.save
       expect(@product.errors.full_messages).to include("Name can't be blank")
    end 
    
    it 'should have a price' do
      @category = Category.new(name: "great")
      @category.save!
      @product = Product.new(name: 'name' , price: nil , quantity: 30, category: @category)
      @product.save
      expect(@product.errors.full_messages).to include("Price can't be blank")
   end 

   it 'should have a quantity' do
    @category = Category.new(name: "great")
    @category.save!
    @product = Product.new(name:'name' , price:'1000', quantity: nil , category: @category)
    @product.save
    expect(@product.errors.full_messages).to include("Quantity can't be blank")
   end 

   it 'should have a category' do
    @category = Category.new(name: "great")
    @category.save!
    @product = Product.new(name: 'name' , price:'1000', quantity: 30, category: nil)
    @product.save
    expect(@product.errors.full_messages).to include("Category can't be blank")
   end 
  end
end
