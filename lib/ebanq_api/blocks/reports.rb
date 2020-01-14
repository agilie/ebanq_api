# frozen_string_literal: true

require 'ebanq_api/client'
require 'ebanq_api/api_paths'

# Reports block
module EbanqApi
  ##
  # This class represents an reports functional of Ebanq REST Api.
  class Reports
    include ApiPaths
    # Declares an client instance.
    def initialize(client)
      @client = client
    end

    # Get all available Report types
    # /api/v1/reports
    #
    # @return Array
    def types
      @client.make_request :get, reports_path
    end

    # Get report All Accounts Transactions
    # /api/v1/reports/aat
    #
    # ==== Attributes
    #
    # * +options+ - hash of options for request,
    # e.g. {page: 1, per_page: 'all', sort: 'amount'}
    # * * +page+ - Number of page with transactions (Number)
    # * * +date_from+ - Start date for transactions.
    # Format - YYYY-MM-DD (String)
    # * * +date_to+ - End date for transactions.
    # Format - YYYY-MM-DD (String)
    # * * +user_name+ (required) - Name of the user who
    # own the accounts. (String)
    # * * +sort+ - Sorting for transactions list.
    # Allowed values: id, date, amount, description. (String)
    # * * +order+ - Order of sorting for transactions list.
    # Allowed values: asc, desc. (String)
    # * * +per_page+ - Amount of transactions per page.
    # Allowed values: positive numbers, all.
    # The "all" value can be used to return all transactions
    # but if the total number of transactions exceeds 3000,
    # issues may arise in trying to process the request.
    # In the case of a large volume of transactions
    # it's advisable to restrict the results using
    # the per_page parameter setting it to 3000. (String)
    def all_accounts_transactions(options = {})
      @client.make_request :get, reports_path('aat'), options
    end

    # Get report All Accounts Balances
    # /api/v1/reports/aab
    #
    # ==== Attributes
    #
    # * +options+ - hash of options for request,
    # e.g. {page: 3, sort: 'amount'}
    # * * +page+ - Number of page with transactions (Number)
    # * * +date_from+ - Start date for transactions.
    # Format - YYYY-MM-DD (String)
    # * * +user_name+ - Name of the user who own the accounts. (String)
    # * * +date_to+ - End date for transactions.
    # Format - YYYY-MM-DD (String)
    # * * +sort+ - Sorting for transactions list.
    # Allowed values: id, date, amount, description. (String)
    # * * +order+ - Order of sorting for transactions list.
    # Allowed values: asc, desc. (String)
    def all_accounts_balances(options = {})
      @client.make_request :get, reports_path('aab'), options
    end

    # Get report Specific Account Statement
    # /api/v1/reports/sas
    #
    # ==== Attributes
    #
    # * +account_id+ (required) -The ID of the account for report.
    # Use only for type sas (Number)
    # * +options+ - hash of options for request,
    # e.g. {page: 1, per_page: 'all', sort: 'amount', order: 'desc'}
    # * * +page+ - Number of page with transactions (Number)
    # * * +date_from+ - Start date for transactions.
    # Format - YYYY-MM-DD (String)
    # * * +date_to+ - End date for transactions.
    # Format - YYYY-MM-DD (String)
    # * * +sort+ - Sorting for transactions list.
    # Allowed values: id, date, amount, description. (String)
    # * * +order+ - Order of sorting for transactions list.
    # Allowed values: asc, desc. (String)
    # * * +per_page+ - Amount of transactions per page.
    # Allowed values: positive numbers, all.
    # The "all" value can be used to return all transactions
    # but if the total number of transactions exceeds 3000,
    # issues may arise in trying to process the request.
    # In the case of a large volume of transactions it's advisable
    # to restrict the results using the per_page
    # parameter setting it to 3000. (String)
    def specific_account_statement(account_id, options = {})
      @client.make_request :get, reports_path('sas'),
                           options.merge!(account_id: account_id)
    end
  end
end
