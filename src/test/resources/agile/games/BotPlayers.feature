@1.1
Feature: Bot players
  To make up for a small number of players or for testing, the facilitator can add bot players. They are given goals
  in the same way as human players. When the execution starts, each bot tries to reach their goals.

  Scenario: Bot moves towards first goal
    Given a player named "A"
    And a player named "P"
    And a bot player named "B"
    And player named "B" is assigned the two goals "A" and "P"
    And the board looks as:
    And 0 "| | | |A| |"
    And 1 "| | | | |B|"
    And 2 "| | | |P| |"
    When the facilitator starts the game
    Then the board should look like:
    And 0 "| | | |A|B|"
    And 1 "| | | | | |"
    And 2 "| | | |P| |"