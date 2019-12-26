# EbanqApi

A Ruby wrapper for the EBANQ Rest API.
This gem is a work in progress. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ebanq_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ebanq_api

## Usage

Before you start making the requests to EBANQ API provide the `base_url` using the configuration
wrapping. 
```ruby
EbanqApi.config do |config|
  config.base_url = 'http://yourebanqdomain.com'
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/agilie/ebanq_api.
