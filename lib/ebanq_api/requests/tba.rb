# frozen_string_literal: true

require 'rest_client'
require 'json'
require 'ebanq_api/exceptions'

module EbanqApi
  ##
  # This class represents an functional of TBA request
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
  class TBA < Request

    attr_accessor :account_from_id, :amount, :description, :tan

    def initialize(account_from_id, account_to_id, amount, user_name = '', description = '', tan = '')
      super(account_from_id, amount, description, tan)
      @account_to_id = account_to_id
      @user_name = user_name
    end

  end
end
