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
client = EbanqApi::Client.new # client instance which get services_token and use it in all requests

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

 |  Gem Action  |  API Endpoint  | 
 | -------- | ----- | 
 |  **[Registration block](https://agilie.github.io/ebanq_api/EbanqApi/Registration)** | [registration](https://ebanqapi.docs.apiary.io/#reference/registration/post) | 
 |  client.registration.create(**options**) | POST /api/v1/registration/create | 
 |  **[Auth block](https://agilie.github.io/ebanq_api/EbanqApi/Auth)** | [auth](https://ebanqapi.docs.apiary.io/#reference/auth/post) | 
 |  client.auth.login(**arguments**) | POST /api/v1/auth/login | 
 |  client.auth.login_by(**arguments**) | POST /api/v1/auth/login_pin | 
 |  client.auth.login_with_token(**arguments**) | POST /api/v1/auth/login_token | 
 |  client.auth.logout | POST /api/v1/auth/logout | 
 |  client.auth.logout_device(**device_id**) | POST /api/v1/auth/logout_device | 
 |  client.auth.pass_reset_token(**arguments**) | POST /api/v1/auth/user_pass_reset | 
 |  client.auth.refresh_token(**arguments**) | POST /api/v1/auth/token | 
 |  client.auth.request_new_password(**user_name_or_email**) | POST /api/v1/auth/request_new_password | 
 |  client.auth.reset_password(**user_id**) | POST /api/v1/auth/uid/password_reset | 
 |  client.auth.update_push_token(**arguments**) | POST /api/v1/auth/push_token | 
 |  client.auth.update_user_pin(**pin**) | POST /api/v1/auth/pin | 
 |  **[Profile block](https://agilie.github.io/ebanq_api/EbanqApi/Profile)** | [profile](https://ebanqapi.docs.apiary.io/#reference/profile/post) | 
 |  client.profile.list_of_allowed_documents | GET /api/v1/profile | 
 |  client.profile.show(**user_id**) | GET /api/v1/auth/**user_id** | 
 |  client.profile.update(**user_id**, **options**) | POST /api/v1/auth/**user_id** |
 |  **[Accounts Block](https://agilie.github.io/ebanq_api/EbanqApi/Accounts)** | [accounts](https://ebanqapi.docs.apiary.io/#reference/accounts/post) | 
 |  client.accounts.list | GET /api/v1/accounts | 
 |  client.accounts.show(**account_id**, **options**) | GET /api/v1/accounts/**account_id** | 
 |  client.accounts.operation(**arguments**) | POST /api/v1/accounts/operation |  
 |  **[Cards block](https://agilie.github.io/ebanq_api/EbanqApi/Cards)** | [cards](https://ebanqapi.docs.apiary.io/#reference/cards/post) | 
 |  client.cards.list | GET /api/v1/cards | 
 |  client.cards.show(**card_id**) | GET /api/v1/cards/**card_id** | 
 |  **[Messages block](https://agilie.github.io/ebanq_api/EbanqApi/Messages)** | [messages](https://ebanqapi.docs.apiary.io/#reference/messages/post) | 
 |  client.messages.list(**options**) | GET /api/v1/messages | 
 |  client.messages.show(**message_id**) | GET /api/v1/messages/**message_id** | 
 |  client.messages.unread_count | GET /api/v1/messages/unread-count | 
 |  client.messages.outgoing(**options**) | GET /api/v1/messages/outgoing | 
 |  client.messages.send_to_a_group(**arguments**) | POST /api/v1/messages/send/groups | 
 |  client.messages.send_to_administrator(**arguments**) | POST /api/v1/messages/send | 
 |  client.messages.send_to_all(**arguments**) | POST api/v1/messages/send/all | 
 |  client.messages.delete(**thread_id**) | DELETE /api/v1/messages/**thread_id** | 
 |  **[News block](https://agilie.github.io/ebanq_api/EbanqApi/News)** | [news](https://ebanqapi.docs.apiary.io/#reference/news/post) | 
 |  client.news.list | GET /api/v1/news | 
 |  client.news.show(**news_id**) | GET /api/v1/news/**news_id** | 
 |  **[Reports block](https://agilie.github.io/ebanq_api/EbanqApi/Reports)** | [reports](https://ebanqapi.docs.apiary.io/#reference/reports/post) | 
 |  client.reports.types | GET /api/v1/reports | 
 |  client.reports.all_accounts_balances(**options**) | GET /api/v1/reports/aab | 
 |  client.reports.all_accounts_transactions(**options**) | GET /api/v1/reports/aat | 
 |  client.reports.specific_account_statement(**account_id**, **options**) | GET /api/v1/reports/sas |
 |  **[Requests block](https://agilie.github.io/ebanq_api/EbanqApi/Requests.html)** | [requests](https://ebanqapi.docs.apiary.io/#reference/requests/post) | 
 |  client.reports.types | GET /api/v1/requests/ | 
 |  client.requests.show(**transfer_request_id**) | GET /api/v1/requests/**transfer_request_id** | 
 |  client.requests.approve(**request_id**) | POST /api/v1/requests/approve | 
 |  client.requests.create_cft(**options**) | POST /api/v1/requests/cft | 
 |  client.requests.create_owt(**options**) | POST /api/v1/requests/owt | 
 |  client.requests.create_tba(**options**) | POST /api/v1/requests/tba | 
 |  client.requests.create_tbu(**options**) | POST /api/v1/requests/tbu | 
 |  **[Settings block](https://agilie.github.io/ebanq_api/EbanqApi/Settings)** | [settings](https://ebanqapi.docs.apiary.io/#reference/settings/post) | 
 |  client.settings.list | GET /api/v1/settings | 
 |  client.settings.countries | GET /api/v1/settings/countries | 
 |  client.settings.currencies | GET /api/v1/settings/currencies | 
 |  client.settings.fee_types | GET /api/v1/settings/fee-types | 
 |  client.settings.fields | GET /api/v1/settings/fields | 
 |  client.settings.update(**arguments**) | POST /api/v1/settings/update | 
 |  **[Templates block](https://agilie.github.io/ebanq_api/EbanqApi/Templates)** | [templates](https://ebanqapi.docs.apiary.io/#reference/templates/post) | 
 |  client.templates.list | GET /api/v1/templates | 
 |  client.templates.show(**template_id**) | GET /api/v1/templates/**template_id** | 
 |  client.templates.cft_list | GET /api/v1/templates/cft | 
 |  client.templates.owt_list | GET /api/v1/templates/owt | 
 |  client.templates.tbu_list | GET /api/v1/templates/tbu | 
 |  client.templates.create | PUT /api/v1/templates | 
 |  client.templates.delete(**template_id**) | DELETE /api/v1/templates/**template_id** | 
 |  **[Transactions block](https://agilie.github.io/ebanq_api/EbanqApi/Transactions)** | [transactions](https://ebanqapi.docs.apiary.io/#reference/transactions/post) |  
 |  client.transactions.show(**transaction_id**) | GET /api/v1/transaction/**transaction_id** | 
 |  client.transactions.prepare(**arguments**) | POST /api/v1/transaction/prepare | 
 
 Some methods from the list above accepts a hash as an argument. 
 Check [Gem rdoc documentation](https://agilie.github.io/ebanq_api/) for required and optional arguments for each method.

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

