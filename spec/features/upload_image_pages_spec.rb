require 'rails_helper'

describe 'the upload an image process' do
  it 'uploads a selected image' do
    user = FactoryGirl.create(:user)
    visit user_path(user)
    click_link 'upload photos'
    page.attach_file('image_img_file', 'spec/fixtures/images/photo.jpg')
    click_button 'Create Image'
    expect(page).to have_content 'Images:'
  end
end
