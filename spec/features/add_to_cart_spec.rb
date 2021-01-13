require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js:true do
    #setup 
    before :each do 
      @category = Category.create! name: 'Apparel'
  
      10.times do |n|
        @category.products.create!(
          name: Faker::Hipster.sentence(3),
          description: Faker::Hipster.paragraph(4),
          image: open_asset('apparel1.jpg'), 
          quantity: 10,
          price: 64.99
        )
      end
    end 
    
    scenario "They see My Cart(1)" do
      #ACT
      visit '/products'
  
      #DEBUG/VERIFY
      
      first('article.product').find_button('Add').click
      save_screenshot
      expect(page).to have_content 'My Cart (1)'      
    end
end
