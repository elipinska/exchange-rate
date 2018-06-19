Feature: ExchangeRate
  ExchangeRate can update FX data by running a CLI command.

  Scenario: Exchange rate contains a 0
    When I run `exchange_rate fetch_rates`
    Then the output should contain "FX rates updated"
