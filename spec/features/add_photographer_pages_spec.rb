require 'rails_helper'

describe "the add a photographer process" do
  it "adds a new photographer" do
    visit photographers_path
    click_link 'new photographer'
    fill_in 'Name', :with => 'Test Photographer'
    fill_in 'Address', :with => '123 Main St'
    fill_in 'Phone', :with => '(123) 456-7890'
    fill_in 'Email', :with => 'heythere@email.com'
    click_on 'Create Photographer'
    expect(page).to have_content 'Test Photographer'
  end

  it "gives error when no name is entered" do
    visit new_photographer_path
    click_on 'Create Photographer'
    expect(page).to have_content 'errors'
  end
end
