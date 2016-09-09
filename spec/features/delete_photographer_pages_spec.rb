require 'rails_helper'

describe "the delete a photographer process" do
  it "deletes a photographer" do
    photographer = Photographer.create(:name => 'Leah', :address => '123 Main St', :phone => '(206)715-7537', :email => 'lcnels@msn.com')
    visit photographer_path(photographer)
    click_on 'delete'
    expect(page).to have_content 'no photographers yet'
  end
end
