Feature: Email results and resources to user

User should be able to have their results
emailed to an address of their choosing
to keep for their records.

Email body text, etc will be specified later.

  Scenario: Email to valid address
    Given I have completed a survey
    When I enter "foo@example.com" in the email field
    Then an email is sent to "foo@example.com"
