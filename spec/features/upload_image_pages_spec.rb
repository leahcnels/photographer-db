require 'rails_helper'

describe 'the upload an image process' do
  it 'uploads a selected image' do
    user = FactoryGirl.create(:user, :photographer => true)
    visit log_in_path
    fill_in 'Email', :with => 'leahcnels@gmail.com'
    fill_in 'Password', :with => 'password'
    click_on 'Log in'
    visit user_path(user)
    click_link 'upload photos'
    page.attach_file('image_img_file', 'spec/fixtures/images/photo.jpg')
    click_button 'Create Image'
    expect(page).to have_content 'Images:'
  end

  it 'uploads a selected image' do
    user = FactoryGirl.create(:user, :photographer => true)
    visit log_in_path
    fill_in 'Email', :with => 'leahcnels@gmail.com'
    fill_in 'Password', :with => 'password'
    click_on 'Log in'
    visit user_path(user)
    click_link 'upload photos'
    page.attach_file('image_img_file', 'README.md')
    click_button 'Create Image'
    expect(page).to have_content "Upload unsuccessful, please try again!"
  end
end
