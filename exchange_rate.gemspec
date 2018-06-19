
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "exchange_rate/version"

Gem::Specification.new do |spec|
  spec.name          = "exchange_rate"
  spec.version       = ExchangeRate::VERSION
  spec.authors       = ["elipinska"]
  spec.email         = ["ewa.lipinska@hotmail.com"]

  spec.summary       = %q{A simple Ruby gem for obtaining FX rates}
  spec.description   = %q{A Ruby library which uses the 90 day European Central
Bank (ECB) feed to provide foreign exchange rates for 33 different currencies based on a particular date (the endpoint can be changed to your data source of choice, as long as it follows ECB's feed format). The data is cached locally and can be updated at any point.}
  spec.homepage      = "https://github.com/elipinska/exchange-rate"
  spec.license       = "MIT"

  # Specifies which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"

  spec.add_dependency "nokogiri", "~> 1.8"
  spec.add_dependency "thor", "~> 0.20"
end
