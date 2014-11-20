require 'rails_helper'
require 'helpers/usersignup'

describe 'liking posts' do
  before do
    usersignup
  end

  it 'a user can like a photo, which will update the like count', js: true do
    visit '/'
    find('#addphotolink').trigger('click')
    fill_in('Caption', with: 'coool')
    attach_file('Image', "spec/fixtures/lager.jpeg")
    find_button('Upload photo').trigger('click')
    click_link 'Like'
    expect(page).to have_content('1 likes')
  end
end