require 'rails_helper'

describe "the category indexing process" do
  it "shows a list of all categories" do
    category = FactoryGirl.create(:category)
    category2 = FactoryGirl.create(:category, :name => 'More Stuff')
    visit categories_path
    expect(page).to have_content 'More Stuff'
  end
end
