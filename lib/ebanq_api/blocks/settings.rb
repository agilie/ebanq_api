# frozen_string_literal: true

require 'ebanq_api/client'
require 'ebanq_api/api_paths'

# Settings block
module EbanqApi
  ##
  # This class represents an settings functional of Ebanq REST Api.
  class Settings
    include ApiPaths
    # Declares an client instance.
    def initialize(client)
      @client = client
    end

    # Get User Settings
    # /api/v1/settings
    #
    # ==== Examples
    #
    #   client.settings.list
    def list
      @client.make_request :get, settings_path
    end

    # Load specific system settings (currencies)
    # /api/v1/settings/currencies
    #
    # ==== Examples
    #
    #   client.settings.currencies
    # @return Array
    def currencies
      @client.make_request :get, settings_path('currencies')
    end

    # Load specific system settings (countries)
    # /api/v1/settings/countries
    #
    # ==== Examples
    #
    #   client.settings.countries
    # @return Array
    def countries
      @client.make_request :get, settings_path('countries')
    end

    # Retrieve user's profile data
    # /api/v1/settings/fields
    #
    # ==== Examples
    #
    #   client.settings.fields
    def fields
      @client.make_request :get, settings_path('fields')
    end

    # Load specific system settings
    # /api/v1/settings/fee-types
    #
    # ==== Examples
    #
    #   client.settings.fee_types
    # @return Array
    def fee_types
      @client.make_request :get, settings_path('fee-types')
    end

    # Update user security question and password
    # /api/v1/settings/update
    #
    # ==== Attributes
    #
    # * +security_question_id+ (required) - (String)
    # * +security_question_answer+ (required) - (String)
    # * +options+ - hash of options for request,
    # e.g. {old_password: "in do labore tempor",
    # new_password: "velit ut nisi",
    # pending_executed: -53369806,
    # user_transfer: -43209232}
    # * * +old_password+ (String)
    # * * +new_password+ (String)
    # * * +pending_executed+ (Number)
    # * * +user_transfer+ (Number)
    # * * +internal_message+ (Number)
    # * * +failed_login_attempt+ (Number)
    # * * +funds_added+ (Number)
    # * * +unread_news_available+ (Number)
    #
    # ==== Examples
    #
    #   options = {old_password: "in do labore", new_password: "velit",
    #   pending_executed: -53369806, user_transfer: -43209232}
    #   client.settings.update(9, 'cat', options)
    def update(security_question_id, security_question_answer, options = {})
      question_data = {
        security_question_id: security_question_id,
        security_question_answer: security_question_answer
      }
      @client.make_request :post,
                           settings_path('update'),
                           options.merge!(question_data)
    end
  end
end
