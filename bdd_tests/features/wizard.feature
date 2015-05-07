Feature: Wizard
  Scenario: I start out with Houghton
    Given I am on the survey
    Then I see the header "Houghton Questions"

  Scenario: There is a next button
    Given I am on the survey
    Then I see a "Next >" button

  Scenario: Clicking Next moves me forward
    Given I am on the survey
    When I fill in the Houghton questions
    When I advance through the wizard
    Then I see the header "Activites-specific Balance Confidence (ABC) Scale"
    When I advance through the wizard
    Then I see the header "Balance Test 1"
    When I fill in the Balance 1 questions
    When I advance through the wizard
    Then I see the header "Balance Test 2"
    Then I see the text "Are you able to look behind (both) shoulders?"
    When I fill in the Balance 2 questions
    When I advance through the wizard
    Then I see the text "Answers Submitted"

  Scenario: I can go back
    Given I am on the survey
      and I have advanced to the end
    Then I see the text "Answers Submitted"
    When I reverse through the wizard
    Then I see the header "Balance Test 2"
    Then I see the text "Are you able to look behind (both) shoulders?"
    When I reverse through the wizard
    Then I see the header "Balance Test 1"
    When I reverse through the wizard
    Then I see the header "Activites-specific Balance Confidence (ABC) Scale"
    When I reverse through the wizard
    Then I see the header "Houghton Questions"
