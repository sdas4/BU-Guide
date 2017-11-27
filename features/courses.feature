Feature: Courses
As a user
I want to see the various courses listed
So that I can decide the courses to choose from

Background: courses in database
 
  Given the following courses exist:
  | abbrev       | name                 | crn    | teacher         |
  | CS 545        | Software Engineering | ###### | Rose M Williams |
  | CS 550        | Operating Systems    | ###### | Prof X          |
  | CS 555        | Visual Processing    | ###### | Prof Y          |
  | CS 560        | computer graphics    | ###### | Prof Z          |

Scenario: User adds a course
Given I am on the courses
When I press "Add New Course"
Then I go to the specific course
Then I should see "Enter New Course"
And I fill in "Course Abbreviation" with "CS 585"
And I fill in "Course Name" with "Some Grad Class"
And I fill in "CRN" with "#1#1#1"
And I fill in "Handling Professor" with "Prof. Teacher"
Then I press "Save Changes"
Then I should see "All Courses"
And I should see "CS 585"

Scenario: User views the courses
Given I am on the courses
Then I should see "All Courses"
And I click "CS 545"
Then I should see "Details about CS 545"
And I should not see "CS 550"

Scenario: User updates a course
Given I am on the courses
When I click "CS 560"
Then I should see "Details about CS 560"
Then I click "Edit"
Then I should see "Edit Existing Course"
And I fill in "Course Name" with "#####1"
Then I press "Update Course Info"
Then I should see "CS 560 was successfully updated"

Scenario: User deletes a course
Given I am on the courses
When I follow "CS 555"
Then I press "Delete"
Then I should see "Course 'CS 555' deleted."

Scenario: User returns to Dashboard from courses
Given I am on the courses
When I press "Back to Dashboard"
Then I go to the dashboard
Then I should see "Dashboard"

Scenario: User enters a duplicate course record
Given I am on the courses
When I press "Add New Course"
Then I go to the specific course
Then I should see "Enter New Course"
And I fill in "Course Abbreviation" with "CS 545"
Then I press "Save Changes"
Then I should see "CS 545 already exists!"

Scenario: User enters a empty course record
Given I am on the courses
When I press "Add New Course"
Then I go to the specific course
Then I should see "Enter New Course"
And I fill in "Course Abbreviation" with ""
Then I press "Save Changes"
Then I should see "Invalid Course Entry."

# Scenario: User follows link from course page to professor page
# Given I am on the courses
# And I click "CS 545"
# Then I should see "Details about CS 545"
# Then I click "Rose M Williams"
# Then I should see "Details about Rose M Williams"