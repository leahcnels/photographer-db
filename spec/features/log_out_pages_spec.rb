require 'rails_helper'

describe "the log in process" do
  it "allows a user to log in" do
    user = FactoryGirl.create(:user)
    visit log_out_path
    expect(page).to have_content 'You\'ve been logged out successfully.'
  end
end
