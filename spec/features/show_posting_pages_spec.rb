require 'rails_helper'

describe 'the show postings process' do
  it 'shows a list of postings' do
    user = FactoryGirl.create(:user)
    posting = FactoryGirl.create(:posting, :user_id => user.id)
    visit postings_path
    expect(page).to have_content 'Hey'
  end
end
