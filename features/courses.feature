Feature: Courses
As a user
I want to see the various courses listed
So that I can decide the courses to choose from

Background: courses in database
 
  Given the following courses exist:
 # | Course Abbrev       | Course Name               | CRN    |
  | abbrev       | name                 | crn    |
  | CS545        | Software Engineering | ###### |
  | CS550        | Operating Systems    | ###### |
  | CS555        | Visual Processing    | ###### |
  | CS560        | computer graphics    | ###### |
  
Scenario: User adds a Course
Given I am on the courses
When I press "Add New Course"
Then I go to the specific course
Then I should see "Enter New Course"
And I fill in "abbrev" with "CS585"
Then I press "Save Changes"
Then I should see "All Courses"
And I should see "CS585"

Scenario: User views the Courses
Given I am on the courses
Then I should see "All Courses"
And I click "CS545"
Then I should see "Details about CS545"
And I should not see "CS550"

Scenario: User updates a course
Given I am on the courses
When I click "CS560"
Then I should see "Details about CS560"
Then I click "Edit"
Then I should see "Edit Existing Course"
And I fill in "name" with "#####1"
Then I press "Update Course Info"
Then I should see "CS560 was successfully updated"

Scenario: User deletes a course
Given I am on the courses
When I follow "CS555"
Then I press "Delete"
Then I should see "Course 'CS555' deleted."

Scenario: User returns to Dashboard from courses
Given I am on the courses
When I press "Back to Dashboard"
Then I go to the dashboard
Then I should see "Dashboard"