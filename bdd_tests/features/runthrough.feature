Feature: Run through the survey

User should be able to enter responses to all
the questions and get their score/results at the end.

  Scenario: Low Score
    Given I am on the survey
      and I enter the minimum on all questions
    When I submit
    Then I am shown a failing result
     And I see the results graph
     And I see the additional resources section
     And I see that I have passed "0" tests
     And I see that I have a "4.4"% likelihood of being satisfactory
     And I see the definition of satisfactory user

  Scenario: High Score
    Given I am on the survey
      and I enter the maximum on all questions
    When I submit
    Then I am shown a passing result
     And I see the results graph
     And I see the additional resources section
     And I see that I have passed "4" tests
     And I see that I have a "40.7"% likelihood of being satisfactory
     And I see the definition of satisfactory user
