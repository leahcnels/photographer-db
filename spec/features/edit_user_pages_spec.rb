require 'rails_helper'

describe "the edit a user process" do
  it "edits a user" do
    user = FactoryGirl.create(:user)
    visit edit_user_path(user)
    fill_in 'Name', :with => 'Sally'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    click_on 'Save'
    expect(page).to have_content 'Sally'
  end

  it "gives error when no description is entered" do
    user = FactoryGirl.create(:user)
    visit edit_user_path(user)
    fill_in 'Name', :with => ''
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    click_on 'Save'
    expect(page).to have_content 'Save unsuccessful, please try again!'
  end
end
