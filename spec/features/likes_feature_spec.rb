require 'rails_helper'

describe 'liking posts' do
  before do
    bouncycastle = Photo.create(caption: 'bouncy castle', image: File.open("#{Rails.root}/spec/fixtures/lager.jpeg"))
  end

  it 'a user can like a photo, which will update the like count', js: true do
    visit '/'
    click_link 'Like'
    expect(page).to have_content('1 likes')
  end
end