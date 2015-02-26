Feature: Wizard
  Scenario: I start out with Houghton
    When I access the url "/"
    Then I see the header "Houghton Questions"

  Scenario: There is a next button
    When I access the url "/"
    Then I see a "Next >" button

  Scenario: Clicking Next moves me forward
    When I access the url "/"
    When I click the "Next >" button
    Then I see the header "Activites-specific Balance Confidence (ABC) Scale"
    When I click the "Next >" button
    Then I see the header "Demonstrate your abilities"
    When I click the "Next >" button
    Then I see the header "Demonstrate your abilities"
    Then I see the text "Look behind (both) shoulders"
    When I click the "Next >" button
    Then I see the text "View Results"

  Scenario: I can go back
    When I access the url "/"
    When I click the "Next >" button
    When I click the "Next >" button
    When I click the "Next >" button
    When I click the "Next >" button
    Then I see the text "View Results"
    When I click the "< Previous" button
    Then I see the header "Demonstrate your abilities"
    Then I see the text "Look behind (both) shoulders"
    When I click the "< Previous" button
    Then I see the header "Demonstrate your abilities"
    When I click the "< Previous" button
    Then I see the header "Activites-specific Balance Confidence (ABC) Scale"
    When I click the "< Previous" button
    Then I see the header "Houghton Questions"
