require 'rails_helper'

describe "the edit a photographer process" do
  it "edits a photographer" do
    category = Category.create(:name => 'Headshots')
    photographer = Photographer.create(:name => 'Leah', :address => '123 Main St', :phone => '(206)715-7537', :email => 'lcnels@msn.com', category_ids:[category.id])
    visit photographer_path(photographer)
    click_on 'edit'
    fill_in 'Name', :with => 'Leo'
    click_on 'Update Photographer'
    expect(page).to have_content 'Leo'
  end

  it "gives error when no description is entered" do
    category = Category.create(:name => 'Headshots')
    photographer = Photographer.create(:name => 'Leah', :address => '123 Main St', :phone => '(206)715-7537', :email => 'lcnels@msn.com', category_ids:[category.id])
    visit photographer_path(photographer)
    click_on 'edit'
    fill_in 'Name', :with => ''
    click_button 'Update Photographer'
    expect(page).to have_content 'errors'
  end
end
