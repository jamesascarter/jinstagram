require 'rails_helper'

describe 'photos' do
  context 'no photos have yet been added' do

    it 'should notify user when no photos on feed' do
    visit '/photos'
    expect(page).to have_content 'No photos'
    end

    it 'should allow user to click upload link' do
    visit '/photos'
    expect(page).to have_link 'Add a photo'
    end

  end

  context 'have been uploaded' do
    before do
      Photo.create(image: File.open("#{Rails.root}/spec/fixtures/files/lagertest.png"), caption:'lovely stuff')
    end

    it 'user can see them' do
      visit '/photos'
      save_and_open_page
      expect(page).to have_css 'img'
    end
  end
end
