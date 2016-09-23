require 'rails_helper'

describe "the category indexing process" do
  it "shows a list of all users who are photographers" do
    user = FactoryGirl.create(:user, :photographer=>true)
    visit root_path
    click_on "photographers"
    expect(page).to have_content 'Leah'
  end
end
