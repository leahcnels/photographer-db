require 'rails_helper'

describe "the show user process" do
  it "shows a user's profile" do
    user = FactoryGirl.create(:user)
    visit user_path(user)
    expect(page).to have_content 'Leah'
  end
end
