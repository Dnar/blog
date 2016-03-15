require "spec_helper"

feature "Account_Creation" do
  scenario "allows guest to create account" do
    visit new_user_registration_path

    sign_up

    expect(page).to have_content I18n.t('devise.registrations.signed_up')
    
  end

end