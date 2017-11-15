Feature: Professors
As a user
I want to see all the professors of the department
So that I can view all their details and schedules
  
Scenario: User views the Professors
Given I am on the professors
When I press "Add New Professor"
Then I go to the new professor
Then I should see "Enter New Professor"
Then I press "Save Changes"
Then I should see "All Professors"

When I press "Back to Dashboard"
Then I go to the dashboard
Then I should see "Dashboard"