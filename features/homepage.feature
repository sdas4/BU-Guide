# feature/bsg1.feature
Feature: Dashboard
As a guest user
I want to see the dashboard when i click on the button provided to open the Dashboard
So that I can view and explore the information

Scenario: User sees the dashboard
Given I am on the homepage
When I press "Sign in as Guest"
When I go to the dashboard
Then I should see "Dashboard"