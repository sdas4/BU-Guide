Feature: User
As a new user
I want to register with the application
So that I can check the various courses and professors listed from my account


Background: professors in database
 
  Given the following users exist:
# | Professor name    | Professor's office    |
  | username       | password               | emailID                |
  |  jarrod_stone  | jstone1                | jstone1@binghamton.edu |


Scenario: User Registration
Given I am on the homepage
When I press "Sign Up"
Then I go to the registration
And I should see "User Registration"
And I fill in "E-Mail ID" with "einstein@gmail.com"
And I fill in "Username" with "einstein"
And I fill in "Password" with "relativity"
And I press "Register"
Then I should see "User Successfully Registered"

Scenario: Duplicate User
Given I am on the homepage
When I press "Sign Up"
Then I go to the registration
And I should see "User Registration"
And I fill in "E-Mail ID" with "jstone1@binghamton.edu"
And I fill in "Username" with "jarrod_stone"
And I fill in "Password" with "jstone1"
And I press "Register"
Then I should see "Invalid Registration. "

Scenario: Invalid User
Given I am on the homepage
When I press "Sign Up"
Then I go to the registration
And I should see "User Registration"
And I fill in "E-Mail ID" with "jstone1.binghamton"
And I press "Register"
Then I should see "Invalid Registration."