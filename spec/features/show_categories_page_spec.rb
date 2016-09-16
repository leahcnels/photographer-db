require 'rails_helper'

describe "the show categories process" do
  it "shows the category page" do
    category = FactoryGirl.create(:category)
    visit category_path(category)
    expect(page).to have_content 'Stuff'
  end
end
