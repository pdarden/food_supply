require 'spec_helper'

feature "Adding Food Item" do
  scenario "Add food item with valid attributes" do
    food_item = FactoryGirl.build(:inventory_item)
    food_item_2 = FactoryGirl.build(:inventory_item, title: 'Scallop')
    visit '/inventory_items/new'
    fill_in 'Title', with: food_item.title
    fill_in 'Description', with: food_item.description
    fill_in 'Quantity', with: food_item.quantity

    click_on 'Create Inventory item'

    visit '/inventory_items'
    expect(page).to have_content food_item.title
    expect(page).to_not have_content food_item_2.title
  end

  scenario "Add food item with invalid attributes" do
    visit '/inventory_items/new'
    click_on 'Create Inventory item'
    expect(page).to have_content "Title can't be blank"
    expect(page).to have_content "Description can't be blank"
    expect(page).to have_content "Quantity can't be blank"
  end
end
