Feature: Wizard
  Scenario: I start out with Houghton
    Given I am on the survey
    Then I see the header "Houghton Questions"

  Scenario: There is a next button
    Given I am on the survey
    Then I see a "Next >" button

  Scenario: Clicking Next moves me forward
    Given I am on the survey
    When I advance through the wizard
    Then I see the header "Activites-specific Balance Confidence (ABC) Scale"
    When I advance through the wizard
    Then I see the header "Demonstrate your abilities"
    When I advance through the wizard
    Then I see the header "Demonstrate your abilities"
    Then I see the text "Look behind (both) shoulders"
    When I advance through the wizard
    Then I see the text "View Results"

  Scenario: I can go back
    Given I am on the survey
      and I have advanced to the end
    Then I see the text "View Results"
    When I reverse through the wizard
    Then I see the header "Demonstrate your abilities"
    Then I see the text "Look behind (both) shoulders"
    When I reverse through the wizard
    Then I see the header "Demonstrate your abilities"
    When I reverse through the wizard
    Then I see the header "Activites-specific Balance Confidence (ABC) Scale"
    When I reverse through the wizard
    Then I see the header "Houghton Questions"
