require 'rails_helper'
require 'helpers/usersignup'

describe 'photos' do
  context 'no photos have yet been added' do

    it 'should notify user when no photos on feed' do
      visit '/photos'
      expect(page).to have_content 'No photos'
    end

    it 'should allow user to click upload link if logged in' do
      usersignup
      visit '/photos'
      expect(page).to have_link 'Add a photo'
    end

  end
end

  describe "user signed in" do

  context 'have been uploaded' do
    before do
      usersignup
      photoupload
    end

    it 'user can see photo' do
      visit '/photos'
      expect(page).to have_css 'img'
    end

    it 'user can see caption' do
      visit '/photos'
      expect(page).to have_content 'coool'
    end
   end

  context 'adding new photos' do

    it 'prompts user to use uploader and will display the caption on the page' do
      usersignup
      visit '/'
      click_link 'Add a photo'
      fill_in 'Caption', with: 'lovely stuff'
      click_button 'Upload photo'
      expect(page).to have_content 'lovely stuff'
      expect(current_path).to eq '/photos'
    end

    it 'shows the user email address with post' do
      usersignup
      visit '/'
      click_link 'Add a photo'
      fill_in 'Caption', with: 'lovely stuff'
      click_button 'Upload photo'
      expect(page).to have_content 'test@test.com'

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

    it 'is not allowed if nor signed in' do
      visit '/'
      expect(page).not_to have_link 'Add a photo'
    end
end

context 'viewing photos' do
    before do
      usersignup
      photoupload
    end

    it 'lets a user view a photo if not signed in' do
      visit '/photos'
      click_link 'Sign out'
      expect(page).to have_css 'img'

    end

    it 'lets a user see photos on seperate page' do
      visit '/photos'
      click_link 'coool'
      expect(page).to have_css 'img'
    end
end

describe 'deleting photos' do
    before do
      usersignup
      photoupload
    end

    it 'removes a photo when user clicks a delete link' do
      visit '/photos'
      click_link 'Delete'
      expect(page).not_to have_content 'coool'
      expect(page).to have_content 'photo deleted successfully'
    end

    it 'only works when same user created the photo' do
      click_link 'Sign out'
      usersignup1
      visit '/photos'
      expect(page).not_to have_link('Delete')
    end
  end
end

