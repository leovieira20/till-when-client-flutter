Feature: Queue

  Scenario: Done workable item
    Given workable item is done
    When queue is created
    Then there should be no tasks for today

  Scenario Outline: Queue with different quotas
    Given a queue with <quota> per day
    And <items> workable items
    And workable item is pending
    And <tasks> are present
    When queue is created
    Then first day should have <firstDay> tasks
    And second day should have <secondDay> tasks
    Examples:
      | items | quota | tasks | firstDay | secondDay |
      | 1     | 1     | 1     | 1        | 0         |
      | 1     | 1     | 2     | 1        | 1         |
      | 1     | 2     | 2     | 2        | 0         |
      | 1     | 2     | 3     | 2        | 1         |
      | 2     | 2     | 4     | 2        | 2         |


