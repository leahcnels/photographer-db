require 'rails_helper'

describe "the delete a posting process" do
  it "deletes a posting" do
    user = FactoryGirl.create(:user)
    posting = FactoryGirl.create(:posting, :user_id=>user.id)
    visit log_in_path
    fill_in 'Email', :with => 'leahcnels@gmail.com'
    fill_in 'Password', :with => 'password'
    click_on 'Log in'
    visit posting_path(posting)
    click_on 'delete'
    expect(page).to have_content "Posting deleted!"
  end
end
