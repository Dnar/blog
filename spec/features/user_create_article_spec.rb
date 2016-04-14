require "spec_helper"

feature "Article_Creation" do
    before (:all) do
      sign_up
    end
    
  scenario "allows user to visit new article page" do
    visit new_article_path

    expect(page).to have_content I18n.t('devise.registrations.signed_up')
    
  end

  scenario "allows user to create new article" do

    visit '/articles/new'
    fill_in :title, :with => 'something title'
    fill_in :text, :with => 'something text'
    click_button 'Опубликовать'

    #expect(page).to have_content 'Thanks'
  end

end
