require 'rails_helper'

describe 'the add a posting process' do
  it 'requires user to be logged in to post' do
    visit postings_path
    click_on 'New Posting'
    expect(page).to have_content 'You must be logged in to do that!'
  end

  it 'adds a posting to the list of postings' do
    user = FactoryGirl.create(:user)
    visit log_in_path
    fill_in 'Email', :with => 'leahcnels@gmail.com'
    fill_in 'Password', :with => 'password'
    click_on 'Log in'
    visit postings_path
    click_link 'New Posting'
    fill_in 'Title', :with => 'Yo'
    fill_in 'Body', :with => 'Yooooo'
    click_on 'Create Posting'
    expect(page).to have_content 'Yo'
  end
end
