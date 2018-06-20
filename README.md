# ExchangeRate

A Ruby library which uses the 90 day European Central Bank (ECB) feed to provide foreign exchange rates for 33 different currencies based on a particular date (the endpoint can be changed to your data source of choice, as long as it follows ECB's feed format). The data is cached locally and can be updated at any point.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'exchange_rate'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install exchange_rate

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/exchange_rate. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the ExchangeRate project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/exchange_rate/blob/master/CODE_OF_CONDUCT.md).
