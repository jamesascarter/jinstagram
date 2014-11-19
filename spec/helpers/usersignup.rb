def usersignup
  visit '/'
  click_link('Sign up')
  fill_in('Email', with: 'test@test.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end

def usersignup1
  visit '/'
  click_link('Sign up')
  fill_in('Email', with: 'test1@test.com')
  fill_in('Password', with: 'testtest1')
  fill_in('Password confirmation', with: 'testtest1')
  click_button('Sign up')
end

def photoupload
  click_link 'Add a photo'
  fill_in('Caption', with: 'coool')
  attach_file('Image', "spec/fixtures/lager.jpeg")
  click_button 'Upload photo'
end