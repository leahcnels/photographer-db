require 'rails_helper'

describe 'the delete an image process' do
  it 'deletes a selected image' do
    user = FactoryGirl.create(:user)
    visit user_path(user)
    click_link 'upload photos'
    page.attach_file('image_img_file', 'spec/fixtures/images/photo.jpg')
    click_button 'Create Image'
    visit user_image_path(user, user.images.first)
    click_link 'delete image'
    expect(page).to have_content 'Image deleted!'
  end
end
