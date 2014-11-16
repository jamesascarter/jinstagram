require 'rails_helper'
require 'helpers/usersignup'

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
      Photo.create(caption:'lovely stuff', image: File.open("#{Rails.root}/spec/fixtures/lager.jpeg"))
    end

    it 'user can see photo' do
      visit '/photos'
      expect(page).to have_css 'img'
    end

    it 'user can see caption' do
      visit '/photos'
      expect(page).to have_content 'lovely stuff'
    end
  end
end

describe 'adding new photos' do

    it 'prompts user to use uploader and will display the caption on the page' do
      usersignup
      visit '/'
      click_link 'Add a photo'
      fill_in 'Caption', with: 'lovely stuff'
      click_button 'Upload photo'
      expect(page).to have_content 'lovely stuff'
      expect(current_path).to eq '/photos'
    end

    it 'allows user to upload a photo and view it on the page' do
      usersignup
      visit '/photos'
      click_link 'Add a photo'
      fill_in 'Caption', with: 'lovely stuff'
      attach_file 'Image', "public/owl.jpeg"
      click_button 'Upload photo'
      expect(page).to have_css 'img'
    end
end

describe 'viewing photos' do
    before do
      @owly = Photo.create(caption:'lovely stuff', image: File.open("#{Rails.root}/spec/fixtures/lager.jpeg"))
    end

    it 'lets a user view a photo' do
      visit '/photos'
      click_link 'lovely stuff'
      expect(current_path).to eq "/photos/#{@owly.id}"
    end

    it 'lets a user see photos on seperate page' do
      visit '/photos'
      click_link 'lovely stuff'
      expect(page).to have_css 'img'
    end
end

describe 'deleting restaurants' do
    before do
      usersignup
      @owly = Photo.create(caption:'lovely stuff', image: File.open("#{Rails.root}/spec/fixtures/lager.jpeg"))
    end

    it 'removes a photo when user clicks a delete link' do
      visit '/photos'
      click_link 'Delete'
      expect(page).not_to have_content 'lovely stuff'
      expect(page).to have_content 'photo deleted successfully'
    end
  end


