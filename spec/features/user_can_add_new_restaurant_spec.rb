require 'rails_helper'

feature "user can add restaurants" do
  scenario "successfully adds a new restaurant" do
    visit new_restaurant_path

    fill_in "Name", with: "Restaurant 001"
    fill_in "Address", with: "123 Main St."
    fill_in "City", with: "Cambridge"
    fill_in "State", with: "MA"
    fill_in "Zip", with: "00000"
    fill_in "Website", with: "Restaurant.com"
    fill_in "Picture url", with: "Restaurant.com/picture"
    click_button "Add Restaurant"

    expect(page).to have_content "Restaurant successfully added"
  end

  scenario "unsuccessfully submits a form" do
    visit new_restaurant_path

    click_button "Add Restaurant"

    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Address can't be blank"
    expect(page).to have_content "City can't be blank"
    expect(page).to have_content "State can't be blank"
    expect(page).to have_content "Zip can't be blank"
    expect(page).to have_content "Add a Cambridge Restaurant"
  end
end