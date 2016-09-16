require 'rails_helper'

describe "the delete a user process" do
  it "deletes a user" do
    user = FactoryGirl.create(:user)
    visit edit_user_path(user)
    click_on 'delete'
    expect(page).to have_content 'User deleted!'
  end
end
