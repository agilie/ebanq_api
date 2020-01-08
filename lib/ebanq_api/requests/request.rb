# frozen_string_literal: true

require 'rest_client'
require 'json'
require 'ebanq_api/exceptions'

module EbanqApi
  ##
  # This class represents request functionality.
  class Request
    MESS = 'SYSTEM ERROR: method missing'.freeze

    attr_accessor :account_from_id, :amount, :description, :tan

    def initialize(account_from_id, amount, description, tan)
      @account_from_id = account_from_id
      @amount = amount
      @description = description
      @tan = tan
    end

    def create
      raise MESS
    end
  end
end
