# frozen_string_literal: true

require 'ebanq_api/client'
require 'ebanq_api/api_paths'

# Transactions block
module EbanqApi
  ##
  # This class represents an transactions functional of Ebanq REST Api.
  class Transactions
    include ApiPaths
    # Declares an client instance.
    def initialize(client)
      @client = client
    end

    # Retrieve a transaction
    # /api/v1/transaction/{id}
    #
    # ==== Attributes
    #
    # * +id+ (required) - Transaction id (Number)
    #
    # ==== Examples
    #
    #   client.transactions.show(1)
    def show(id)
      @client.make_request :get, transactions_path(id)
    end

    # Get all transaction types and information for transfers
    # /api/v1/transaction/prepare/
    #
    # ==== Attributes
    #
    # * +type+ (required) - (String)
    # * +account_from+ (required) - (Number)
    # * +account_to+ (required) - (Number)
    # * +required+ (required) - (Number)
    # * +options+ - hash of options for request,
    # e.g. {user: 'sit', description: 'veniam commodo ex'}
    # * * +user+ - (String)
    # * * +description+ - (String)
    #
    # ==== Examples
    #
    #   options = { user: 'sit', description: 'veniam commodo ex' }
    #   client.transactions.prepart('Lorem anim', 48327111, -67357746, -66138775, options)
    def prepare(type, account_from, account_to, amount, options = {})
      values = {
        type: type,
        account_from: account_from,
        account_to: account_to,
        amount: amount
      }.merge!(options)

      @client.make_request :post, transactions_path('prepare'), values
    end
  end
end
