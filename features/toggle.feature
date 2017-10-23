# feature/bsg.feature
Feature: Toggle Menu
As a guest user
I want to see various options when i visit the Dashboard
So that I can get information about the desired feature

Scenario: User sees the toggle menu
Given I am on the dashboard
When I press "Toggle Menu"
Then I should see the feature "Courses"
And I should see the feature "Professors"