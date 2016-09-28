require 'rails_helper'

describe "the edit a user process" do
  it "edits a user", js: true do
    user = FactoryGirl.create(:user)
    visit log_in_path
    fill_in 'Email', :with => 'leahcnels@gmail.com'
    fill_in 'Password', :with => 'password'
    click_on 'Log in'
    visit user_path(user)
    click_on 'edit'
    fill_in 'Name', :with => 'Sally'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    click_on 'Save'
    expect(page).to have_content 'Sally'
  end

  it "gives error when no description is entered", js: true do
    user = FactoryGirl.create(:user)
    visit log_in_path
    fill_in 'Email', :with => 'leahcnels@gmail.com'
    fill_in 'Password', :with => 'password'
    click_on 'Log in'
    visit user_path(user)
    click_on 'edit'
    fill_in 'Name', :with => ''
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    click_on 'Save'
    expect(page).to have_content 'Save unsuccessful, please try again!'
  end

  it "gives does not allow logged in user to edit another user" do
    user = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user, :email=>"asdf@test.com", :password=>"password")
    visit log_in_path
    fill_in 'Email', :with => 'leahcnels@gmail.com'
    fill_in 'Password', :with => 'password'
    click_on 'Log in'
    visit edit_user_path(user2)
    expect(page).to have_content "Access Denied"
  end
end
