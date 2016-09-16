require 'rails_helper'

describe "the log in process" do
  it "allows a user to log in" do
    user = FactoryGirl.create(:user)
    visit log_in_path
    fill_in 'Email', :with => 'leahcnels@gmail.com'
    fill_in 'Password', :with => 'password'
    click_on 'Log in'
    expect(page).to have_content 'You\'ve been logged in.'
  end
end
