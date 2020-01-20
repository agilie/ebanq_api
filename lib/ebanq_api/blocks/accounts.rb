# frozen_string_literal: true

require 'ebanq_api/client'
require 'ebanq_api/api_paths'

# Accounts block
module EbanqApi
  ##
  # This class represents an profile functional of Ebanq REST Api.
  class Accounts
    include ApiPaths
    # Declares an client instance.
    def initialize(client)
      @client = client
    end

    # Retrieve an account
    # /api/v1/accounts/{id}
    #
    # ==== Attributes
    #
    # * +id+ (required) - The ID of the account
    # to retrieve. (Number)
    # * +options+ - hash of options for request
    # e.g. {perpage: 2, page: 1, sort: 'date'}
    # * * +perpage+ - Count of transactions per page (Number)
    # * * +page+ - Number of page with transactions (Number)
    # * * +date_from+ - Start date for transactions.
    # Format - YYYY-MM-DD (String)
    # * * +date_to+ - End date for transactions. Format - YYYY-MM-DD (String)
    # * * +sort+ - Sorting for transactions list.
    # Allowed values: id, date, amount. (String)
    # * * +order+ - Order of sorting for transactions list.
    # Allowed values: asc, desc. (String)
    #
    # ==== Examples
    #
    #   options = { perpage: 2, page: 2 }
    #   client.accounts.show(1, options)
    def show(id, options = {})
      @client.make_request :get, account_path(id), options
    end

    # List of all accounts belonging to user.
    # If endpoint is requested by bank-admin then it returns all accounts
    # of all users Query parameter uid allowed to get all accounts of
    # the particular user by bank-admin.
    # /api/v1/accounts
    #
    # ==== Attributes
    #
    # * +uid+ - The ID of the account to retrieve. (Number)
    #
    # ==== Examples
    #
    #   client.accounts.list
    # @return Array
    def list(uid = '')
      @client.make_request :get, account_path(uid)
    end

    # Executes manual transaction - debit or credit
    # /api/v1/accounts/operation/
    # ==== Attributes
    #
    # * +operation+ (required) - Allowed values: debit, credit (String)
    # * +account_id+ (required) - (Number)
    # * +amount+ (required) - (Number)
    # * +description+ (required) - (String)
    # * +options+ - hash of additional options for request,
    # e.g. {use_revenue_account: 1, apply_iwt: 1}
    # * *  +use_revenue_account+ - Allowed values: 0, 1 (Number)
    # * *  +apply_iwt+ - Allowed values: 0, 1 (Number)
    #
    # ==== Examples
    #
    #   options = { use_revenue_account: 1, apply_iwt: 1 }
    #   client.accounts.operation('credit', 1, 6, 'test', options)
    def operation(operation, account_id, amount, description, options = {})
      values = {
        operation: operation,
        account_id: account_id,
        amount: amount,
        description: description
      }.merge!(options)
      @client.make_request :post,
                           account_path('operation'),
                           values
    end
  end
end
