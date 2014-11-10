require 'rails_helper'

describe 'comments' do
  before do
    Photo.create(caption:'lovely stuff', image: File.open("#{Rails.root}/spec/fixtures/lager.jpeg"))
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