# ExchangeRate

A Ruby library which uses the 90 day European Central Bank (ECB) feed to provide foreign exchange rates for 33 different currencies based on a particular date (the endpoint can be changed to your data source of choice, as long as it follows <a href= "http://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml">ECB's feed</a> format). The data is cached locally and can be updated at any point.

## Installation

To use the gem locally:

Add 'exchange_rate' to your app's Gemfile by including

```
gem 'exchange_rate', :path => "/path/to/exchange_rate"
```
Run ```bundle install```

You can now require 'exchange_rate' in your app's files.


## Usage

### Get exchange rate at date

The ExchangeRate.at method takes three arguments - date within the past 90 days and two currency codes - and returns the exchange rate as BigDecimal (to ensure an accurate result). Today's data will be used if no date is passed as an argument.

```
ExchangeRate.at("2018-06-15", "USD", "GBP")

=> 0.75301828216626422904449810279406692e0
```

Foreign exchange (FX) data can be updated by calling the ExchangeRate.fetch_rates method.

```
ExchangeRate.fetch_rates
```

You can use a different source of FX data as long as it follows the structure of the <a href= "http://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml">ECB's feed</a>. The unique namespace url is optional but can be useful <a href="http://www.nokogiri.org/tutorials/searching_a_xml_html_document.html#namespaces">to avoid name collisions</a>.

```
ExchangeRate.set_data_source("http://www.mywebsite.com/fx_feed.xml", "http://www.mywebsite.com/unique_namespace_url")
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/exchange_rate. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the ExchangeRate project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/exchange_rate/blob/master/CODE_OF_CONDUCT.md).
