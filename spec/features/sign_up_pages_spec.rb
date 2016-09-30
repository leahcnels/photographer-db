require 'rails_helper'

describe "the sign up process" do
  it "allows a user to create an account" do
    visit new_user_path
    fill_in 'Name', :with => 'Leah'
    fill_in 'Email', :with => 'leahcnels@gmail.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    fill_in 'geocomplete', :with => '123 Main Street, Vancouver, WA, United States'
    fill_in 'Phone', :with => '555-555-5555'
    click_on 'Save'
    expect(page).to have_content 'Welcome to the site!'
  end

  it "gives an error if user doesn't enter password" do
    visit new_user_path
    fill_in 'Name', :with => 'Leah'
    fill_in 'Email', :with => 'leahcnels@gmail.com'
    fill_in 'Password', :with => ''
    fill_in 'Password confirmation', :with => ''
    fill_in 'geocomplete', :with => '123 Main St'
    fill_in 'Phone', :with => '555-555-5555'
    click_on 'Save'
    expect(page).to have_content 'There was a problem creating your account. Please try again.'
  end
end
