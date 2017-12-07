Feature: Professors
As a user
I want to see all the professors of the department
So that I can view all their details and schedules


Background: professors in database, courses in database
 
  Given the following professors exist:
# | Professor name    | Professor's office    |
  | name              | office                | classes |
  | Rose M Williams   | EB-Q06                | CS 545  |
  | Kartik Gopalan      | Q-22                    | CS 550  |
  | Lijun Yin            | Q-22                    | CS 555  |

  Given the following courses exist:
  | abbrev | name | crn | teacher |
  | CS 545 | Software Engineering | ###### | Rose M Williams |

Scenario: User adds a Professor
Given I am on the professors
When I press "Add New Professor"
Then I go to the new professor
Then I should see "Enter New Professor"
And I fill in "Professor Name" with "Albert Einstein"
And I fill in "Office Location" with "Swiss Patent Office"
And I fill in "Courses Taught" with "CS 999"
Then I press "Save Changes"
Then I should see "All Professors"
And I should see "Albert Einstein"

Scenario: User views the Professors
Given I am on the professors
Then I should see "All Professors"
And I click "Rose M Williams"
Then I should see "Details about Rose M Williams"
And I should not see "Albert Einstein"

Scenario: User updates a professor
Given I am on the professors
When I click "Rose M Williams"
Then I should see "Details about Rose M Williams"
Then I click "Edit"
Then I should see "Edit Existing Professor"
And I fill in "Professor Name" with "Rose"
Then I press "Update Professor Info"
Then I should see "Rose was successfully updated."

Scenario: User deletes a professor
Given I am on the professors
When I follow "Rose M Williams"
Then I press "Delete"
Then I should see "Professor 'Rose M Williams' deleted."

Scenario: User returns to Dashboard from professors
Given I am on the professors
When I press "Back to Dashboard"
Then I go to the dashboard
Then I should see "Dashboard"

Scenario: User enters a duplicate professor
Given I am on the professors
When I press "Add New Professor"
Then I go to the new professor
Then I should see "Enter New Professor"
And I fill in "Professor Name" with "Rose M Williams"
Then I press "Save Changes"
Then I should see "Name already exists"


Scenario: User enters a empty professor record
Given I am on the professors
When I press "Add New Professor"
Then I go to the new professor
Then I should see "Enter New Professor"
And I fill in "Professor Name" with ""
And I fill in "Office Location" with ""
And I fill in "Courses Taught" with ""
Then I press "Save Changes"
Then I should see "Name can't be blank"

Scenario: User goes to Course from Professor
Given I am on the professors
When I click "Rose M Williams"
Then I should see "Details about Rose M Williams"
Then I follow "CS 545"
Then I should see "Details about CS 545"