def sign_up
  fill_in :email, :with => 'user@example.com'
  fill_in :username, :with => 'User'
  fill_in :password, :with => 'password'
  fill_in :password_confirmation, :with => 'password'

  click_button 'Sign up'

end
