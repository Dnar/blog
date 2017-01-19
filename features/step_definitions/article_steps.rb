Given(/^I am on the contacts page$/) do
  visit('/contacts')
end

When(/^I fill in the contacts form$/) do
  fill_in('contact_message', :with => 'Hello there!')
  find_button('Send Message').click
end

Then(/^I should see a thank you message$/) do
  page.has_content?("Thanks!")
end

# Given /^I have article$/ do |titles, text|
#     Article.new(:title => title, :text => text)
#   end
