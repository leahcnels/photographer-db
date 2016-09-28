require 'rails_helper'

describe "the edit posting process" do
  it "edits a posting", js: true do
    user = FactoryGirl.create(:user)
    posting = FactoryGirl.create(:posting, :user_id=>user.id)
    visit log_in_path
    fill_in 'Email', :with => 'leahcnels@gmail.com'
    fill_in 'Password', :with => 'password'
    click_on 'Log in'
    visit posting_path(posting)
    click_on 'edit'
    fill_in 'Title', :with => 'Hello'
    fill_in 'Body', :with => 'Making changes.'
    click_on 'Update Posting'
    expect(page).to have_content 'Making changes.'
  end

  it "gives error when no title is entered", js: true do
      user = FactoryGirl.create(:user)
      posting = FactoryGirl.create(:posting, :user_id=>user.id)
      visit log_in_path
      fill_in 'Email', :with => 'leahcnels@gmail.com'
      fill_in 'Password', :with => 'password'
      click_on 'Log in'
      visit posting_path(posting)
      click_on 'edit'
      fill_in 'Title', :with => ''
      fill_in 'Body', :with => 'Making changes.'
      click_on 'Update Posting'
      expect(page).to have_content 'Update unsuccessful, please try again!'
    end

  it "gives error when no body is entered", js: true do
    user = FactoryGirl.create(:user)
    posting = FactoryGirl.create(:posting, :user_id=>user.id)
    visit log_in_path
    fill_in 'Email', :with => 'leahcnels@gmail.com'
    fill_in 'Password', :with => 'password'
    click_on 'Log in'
    visit posting_path(posting)
    click_on 'edit'
    fill_in 'Title', :with => 'I love testing.'
    fill_in 'Body', :with => ''
    click_on 'Update Posting'
    expect(page).to have_content 'Update unsuccessful, please try again!'
    end

    it "does not allow a user who is not the poster to edit" do
      user = FactoryGirl.create(:user)
      user2 = FactoryGirl.create(:user, :email=>"asdf@test.com", :password=>"password")
      posting = FactoryGirl.create(:posting, :user_id=>user2.id)
      visit log_in_path
      fill_in 'Email', :with => 'leahcnels@gmail.com'
      fill_in 'Password', :with => 'password'
      click_on 'Log in'
      visit edit_posting_path(posting)
      expect(page).to have_content "You do not have permission to edit this post."
      end
end
