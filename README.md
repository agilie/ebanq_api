# EbanqApi

A wrapper for the EBANQ Rest API. For more detailed documentation please refer to the [Wiki](https://github.com/agilie/ebanq_api/wiki), 
[Gem rdoc documentation](https://agilie.github.io/ebanq_api/) and [official Ebanq API documentation](https://ebanqapi.docs.apiary.io/#).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ebanq_api', github: 'agilie/ebanq_api', branch: 'master'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install ebanq_api
    
## Usage

Before you start making the requests to EBANQ API provide the `base_url`, `token` and `secret` using the configuration
wrapping. 

Create config/initializers/ebanq_api.rb:

```ruby
EbanqApi.config do |config|
    config.base_url = 'http://yourebanqdomain.com'
    config.token = 'put your user token here'
    config.secret = 'put your user secret here'
end
```
 and then 

```ruby
client = EbanqApi::Client.new

client.profile.show(1)
client.profile.update(1, {first_name: 'John', last_name: 'Doe'})
client.cards.list
client.news.list
```

## Troubleshooting

Problems? Check the [Issues](https://github.com/agilie/ebanq_api/issues) block to find 
the solution or create an new issue that we will fix asap. Feel free to contribute.
This project is intended to be a safe, welcoming space for collaboration.

## Author
This gem is open-sourced by [Agilie Team](https://www.agilie.com?utm_source=github&utm_medium=referral&utm_campaign=Git_Ruby&utm_term=ebanq_api)([info@agilie.com](mailto:info@agilie.com))

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/agilie/ebanq_api. This project is intended to be a safe, welcoming space for collaboration and contributors.

## Contact us
If you have any questions, suggestions or just need a help with web or mobile development, 
please email us at <web@agilie.com>. You can ask us anything from basic to complex questions.

We will continue publishing new open-source projects. Stay with us, more updates will follow!

