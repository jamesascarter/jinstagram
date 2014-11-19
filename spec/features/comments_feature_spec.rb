require 'rails_helper'
require 'helpers/usersignup'

describe 'comments' do
  before do
    usersignup
    photoupload
  end

  it 'allows users to leave a commment using a form' do
    visit '/photos'
    click_link 'Add comment'
    fill_in 'Coment', with: 'so so'
    click_button 'Leave comment'
    expect(current_path).to eq '/photos'
    expect(page).to have_content('so so')
  end
end