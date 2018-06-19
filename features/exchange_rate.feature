Feature: ExchangeRate
  In order to get the FX rate for two currencies at a specific date
  As a CLI
  I want to be as objective as possible

  Scenario: Exchange rate contains a 0
    When I run `exchange_rate at Date.today GBP PLN`
    Then the output should contain "0"
