Feature: Contact form

  Scenario: Send an email via the contact form
    Given I am on the contacts page
    When I fill in the contacts form 
    Then I should see a thank you message
