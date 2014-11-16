require 'rails_helper'
require 'helpers/usersignup'

context 'user not signed in and on the homepage' do
  it 'should see both sign in and sign up links' do
    visit('/')
    expect(page).to have_content('Sign in')
    expect(page).to have_content('Sign up')
  end

  it 'should not see sign out link' do
    visit('/')
    expect(page).not_to have_content('Sign out')
  end
end

context 'user signed in on the homepage' do

    before do
    usersignup
  end

  it "should see 'sign out' link" do
    visit('/')
    expect(page).to have_link('Sign out')
  end

  it "should not see a 'sign in' link and a 'sign up' link" do
    visit('/')
    expect(page).not_to have_link('Sign in')
    expect(page).not_to have_link('Sign up')
  end
end