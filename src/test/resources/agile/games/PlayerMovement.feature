@1.0
Feature: Player movement rules
  A game that is on phase execution allows the player to move across the board.
  The player can not move off the board or move to a square that is occupied by
  another player.

  Players can only move when the game is in the execution phase.

  Scenario: Player move within the board
    Given a board with dimensions 5,3
    And the player is at position 3,1 named "P"
    And the board should look like:
    And 0 "| | | | | |"
    And 1 "| | | |P| |"
    And 2 "| | | | | |"
    When the player moves in direction "up"
    Then the player is on position 3,0
    And the board should look like:
    And 0 "| | | |P| |"
    And 1 "| | | | | |"
    And 2 "| | | | | |"

  Scenario: Player can't move to an occupied square
    Given a board with dimensions 5,3
    And the player is at position 0,0 named "P"
    And a player named "A"
    And the board looks as:
    And 0 "|P| | | | |"
    And 1 "|A| | | | |"
    And 2 "| | | | | |"
    When the player moves in direction "down"
    Then the player is on position 0,0
    And the board should look like:
    And 0 "|P| | | | |"
    And 1 "|A| | | | |"
    And 2 "| | | | | |"

  Scenario: Player at the bottom edge of the board
    Given a board with dimensions 5,3
    And the player is at position 1,2 named "P"
    And the board looks as:
    And 0 "| | | | | |"
    And 1 "| | | | | |"
    And 2 "| |P| | | |"
    When the player moves in direction "down"
    Then the board should look like:
    And 0 "| | | | | |"
    And 1 "| | | | | |"
    And 2 "| |P| | | |"

  Scenario: Player at the top edge of the board
    Given a board with dimensions 5,3
    And the player is at position 1,0 named "P"
    And the board looks as:
    And 0 "| |P| | | |"
    And 1 "| | | | | |"
    And 2 "| | | | |"
    When the player moves in direction "up"
    Then the board should look like:
    And 0 "| |P| | | |"
    And 1 "| | | | | |"
    And 2 "| | | | | |"

    Scenario: Player tries to move during estimation phase.
      Given a game is in phase "estimation"
      And the player is at position 1,1
      When the player moves in direction "up"
      Then the player is on position 1,1