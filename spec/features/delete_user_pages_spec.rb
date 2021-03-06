require 'rails_helper'

describe "the delete a user process" do
  it "deletes a user" do
    user = FactoryGirl.create(:user)
    visit log_in_path
    fill_in 'Email', :with => 'leahcnels@gmail.com'
    fill_in 'Password', :with => 'password'
    click_on 'Log in'
    visit user_path(user)
    click_on 'delete'
    expect(page).to have_content 'User deleted!'
  end
end
