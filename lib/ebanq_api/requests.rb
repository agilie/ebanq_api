# frozen_string_literal: true

require 'ebanq_api/client'
require 'ebanq_api/api_paths'

module EbanqApi
  ##
  # This class represents an requests functional of Ebanq REST Api.
  class Requests
    include ApiPaths
    # Declares an client instance.
    def initialize(client)
      @client = client
    end

    # Create TBA request
    # /api/v1/requests/tba
    #
    # ==== Attributes
    # * +account_from_id+ (required) - Id of account (Number)
    # * +account_to_id+ (required) - Id of account (Number)
    # * +amount+ (required) -  (Number)
    # * +user_name+ - Name of the user
    # *Required if request sent by administrator (String)
    # * +description+ - (String)
    # * +tan+ - security number (String)
    def create_tba(account_from_id, account_to_id, amount,
                   user_name = '', description = '', tan = '')
      values = {
        user: user_name,
        account_from: account_from_id,
        account_to: account_to_id,
        amount: amount,
        description: description,
        tan: tan
      }

      @client.make_request :post,
                           requests_path('tba'),
                           values
    end

    # Create TBU request
    # /api/v1/requests/tbu
    #
    # ==== Attributes
    # * +account_from_id+ (required) - Id of account (Number)
    # * +account_to_id+ (required) - Id of account (Number)
    # * +amount+ (required) -  (Number)
    # * +user_to+ (required) -  Name of recipient user (String)
    # * +user_name+ - Name of the user
    # *Required if request sent by administrator (String)
    # * +description+ - (String)
    # * +tan+ - security number (String)
    def create_tbu(account_from_id, account_to_id, amount,
                   user_to, user_name = '', description = '', tan = '')
      values = {
        user: user_name,
        account_from: account_from_id,
        account_to: account_to_id,
        amount: amount,
        description: description,
        user_to: user_to,
        tan: tan
      }

      @client.make_request :post,
                           requests_path('tbu'),
                           values
    end

    # Create CFT request
    # /api/v1/requests/cft
    #
    # ==== Attributes
    # * +account_from_id+ (required) - Id of account (Number)
    # * +card_to_id+ (required) - Id of the card (Number)
    # * +amount+ (required) -  (Number)
    # * +description+ - (String)
    # * +tan+ - security number (String)
    def create_cft(account_from_id, card_to_id, amount,
                   description = '', tan = '')
      values = {
        account_from: account_from_id,
        card_to: card_to_id,
        amount: amount,
        description: description,
        tan: tan
      }

      @client.make_request :post,
                           requests_path('cft'),
                           values
    end

  end
end
