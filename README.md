# ExchangeRate

A Ruby library which uses the 90 day European Central Bank (ECB) feed to provide foreign exchange (FX) rates for 33 different currencies based on a particular date (the endpoint can be changed to your data source of choice, as long as it follows <a href= "http://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml">ECB's feed</a> format). The data is cached locally in a YAML file and can be updated at any point.

## Installation

To install the gem, from your local directory run
```
gem build exchange_rate.gemspec
```
then
```
gem install exchange_rate-0.1.0.gem
```


## Usage

### Get exchange rate at date

The ExchangeRate.at method takes three arguments - date within the past 90 days (either as Date or String) and two currency codes - and returns the exchange rate as BigDecimal (to ensure accuracy). Today's data will be used if no date is passed as an argument. If a weekend date is passed, the closest past date is used as ECB records information for work days only.

```
ExchangeRate.at("2018-06-15", "USD", "GBP")

=> 0.75301828216626422904449810279406692e0
```

### Specify cache file location

As a default, the cache file will be saved in the current directory. To change that, provide your custom path by running

```
ExchangeRate.set_store("cache/file/path")
```


### Update FX rates

FX data can be updated by calling the ExchangeRate.fetch_rates method.

```
ExchangeRate.fetch_rates
```

#### CLI

You can also fetch the most up-to-date FX rates using the command line. This can be used by a scheduler like cron to retrieve data at regular intervals (ECB reference rates are usually updated around 16:00 CET on every working day).

```
exchange_rate fetch
```

If you're using a custom cache location, pass the path to your file as a --path or -p option.

```
exchange_rate fetch --path cache/file/path
exchange_rate fetch --p cache/file/path
```

### Different data source

You can use a different source of FX data as long as it follows the structure of the <a href= "http://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml">ECB's feed</a>. The unique namespace url is optional but can be useful <a href="http://www.nokogiri.org/tutorials/searching_a_xml_html_document.html#namespaces">to avoid name collisions</a>.

```
ExchangeRate.set_data_source("http://www.mywebsite.com/fx_feed.xml", "http://www.mywebsite.com/unique_namespace_url")
```
## Handling errors

Consider catching the following errors:

<b>ExchangeRate::NotFoundError</b> - data or currency not found in the FX data hash
<b>ExchangeRate::InvalidDateError</b> - wrong argument passed as date
<b>ExchangeRate::EmptyFxDataHashError</b> - the XMLParser has received an empty FX data hash when parsing the XML source. If you're using a custom data source, ensure it follows the structure of the <a href= "http://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml">ECB's feed</a> and ensure that you've passed the correct namespace during the setup.

Last but not least, <b>OpenURI::HTTPError</b> for handling issues with retrieving data from an external source.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/elipinska/exchange-rate This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the ExchangeRate project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/elipinska/exchange_rate/blob/master/CODE_OF_CONDUCT.md).
