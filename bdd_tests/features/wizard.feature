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

  Scenario: I can't advance past a section until I've answered the questions
    Given I am on the survey
    Then I see the header "Houghton Questions"
    Then I see a "Next >" button
    Then the "Next >" button is disabled
    When I fill in the Houghton questions
    Then the "Next >" button is enabled
    When I advance through the wizard

    # ABCs default to zero
    Then the "Next >" button is enabled
    When I advance through the wizard

    Then the "Next >" button is disabled
    When I fill in the balance 1 questions
    Then the "Next >" button is enabled
    When I advance through the wizard

    Then the "Next >" button is disabled
    When I fill in the balance 2 questions
    Then the "Next >" button is enabled
    When I advance through the wizard
