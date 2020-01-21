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

## Resources

Client instance provides a series of methods, regarding each EbanqAPI resource. 
They are: Accounts, Cards, Messages, News, Profile, Reports, 
Requests, Settings, Templates and Transactions.
Registration, Auth and Profile functionality available also.

Check [Gem rdoc documentation](https://agilie.github.io/ebanq_api/) for required and optional arguments for each method.

 |  Gem Action  |  API Endpoint  | 
 | -------- | ----- | 
 |  **Accounts Block** |  | 
 |  client.accounts.list | GET /api/v1/accounts | 
 |  client.accounts.show(**account_id**, **options**) | GET /api/v1/accounts/**account_id** | 
 |  client.accounts.operation(**arguments**) | POST /api/v1/accounts/operation |  
 |  **Cards block** |  | 
 |  client.cards.list | GET /api/v1/cards | 
 |  client.cards.show(**card_id**) | GET /api/v1/cards/**card_id** | 
 |  **Messages block** |  | 
 |  client.messages.list(**options**) | GET /api/v1/messages | 
 |  client.messages.show(**message_id**) | GET /api/v1/messages/**message_id** | 
 |  client.messages.unread_count | GET /api/v1/messages/unread-count | 
 |  client.messages.outgoing(**options**) | GET /api/v1/messages/outgoing | 
 |  client.messages.send_to_a_group(**arguments**) | POST /api/v1/messages/send/groups | 
 |  client.messages.send_to_administrator(**arguments**) | POST /api/v1/messages/send | 
 |  client.messages.send_to_all(**arguments**) | POST api/v1/messages/send/all | 
 |  client.messages.delete(**thread_id**) | DELETE /api/v1/messages/**thread_id** | 
 |  **News block** |  | 
 |  client.news.list | GET /api/v1/news | 
 |  client.news.show(**news_id**) | GET /api/v1/news/**news_id** | 
 |  **Reports block** |  | 
 |  client.reports.types | GET /api/v1/reports | 
 |  client.reports.all_accounts_balances(**options**) | GET /api/v1/reports/aab | 
 |  client.reports.all_accounts_transactions(**options**) | GET /api/v1/reports/aat | 
 |  client.reports.specific_account_statement(**account_id**, **options**) | GET /api/v1/reports/sas |
 |  **Requests block** |  | 
 |  client.reports.types | GET /api/v1/requests/ | 
 |  client.requests.show(**transfer_request_id**) | GET /api/v1/requests/**transfer_request_id** | 
 |  client.requests.approve(**request_id**) | POST /api/v1/requests/approve | 
 |  client.requests.create_cft(**options**) | POST /api/v1/requests/cft | 
 |  client.requests.create_owt(**options**) | POST /api/v1/requests/owt | 
 |  client.requests.create_tba(**options**) | POST /api/v1/requests/tba | 
 |  client.requests.create_tbu(**options**) | POST /api/v1/requests/tbu | 


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

