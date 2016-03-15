def sign_up
  fill_in :user_email, :with => 'user@example.com'
  fill_in :user_username, :with => 'User'
  fill_in :user_password, :with => 'password'
  fill_in :user_password_confirmation, :with => 'password'

  click_button 'Sign up'

end