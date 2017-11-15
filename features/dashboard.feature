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


#Feature: Courses
#As a user
#I want to see the various courses listed
#So that I can decide the courses to choose from
  
#Scenario: User views the Courses
Given I am on the dashboard
When I click "Courses"
When I go to the courses
And I should see "All Courses"

Given I am on the dashboard
When I click "Professors"
When I go to the professors
And I should see "All Professors"