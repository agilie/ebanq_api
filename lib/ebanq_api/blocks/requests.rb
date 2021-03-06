# frozen_string_literal: true

require 'ebanq_api/client'
require 'ebanq_api/api_paths'

# Requests block
module EbanqApi
  ##
  # This class represents an requests functional of Ebanq REST Api.
  class Requests
    include ApiPaths

    # Declares an client instance.
    def initialize(client)
      @client = client
    end

    # Get a list of all transfer request
    # /api/v1/requests/
    #
    # ==== Attributes
    # * +options+ - hash of options for request,
    # e.g. {sort: 'description', order: 'asc'}
    # * * +sort+ - Sorting for transactions list.
    # Allowed values: id, date, amount, description. (String)
    # * * +order+ - Order of sorting for transactions list.
    # Allowed values: asc, desc. (String)
    # * * +currency+ - The ID of the transfer request currency (Number)
    # * * +request_types+ - Type of request (Number)
    # * * +request_status+ - Status of the request (Number)
    # * * +date_from+ - Start date for transactions.
    # Format - YYYY-MM-DD (String)
    # * * +date_to+ - End date for transactions. Format - YYYY-MM-DD (String)
    #
    # ==== Examples
    #
    #   client.requests.list(sort: 'description')
    def list(options = {})
      @client.make_request :get, requests_path, options
    end

    # Get one transfer request
    # /api/v1/requests/{id}
    # ==== Attributes
    #
    # * +id+ (required) - Id of the transfer request (Number)
    #
    # ==== Examples
    #
    #   client.requests.show(1)
    def show(id)
      @client.make_request :get, requests_path(id)
    end

    # Create TBA request
    # /api/v1/requests/tba
    #
    # ==== Attributes
    # * +params+ - hash of params for request,
    # e.g. {user: 'John', account_from: 1, account_to: 2, amount: 5}
    # * * +user+ - Name of the user
    # Required if request sent by administrator (String)
    # * * +account_from+ (required) - Id of account (Number)
    # * * +account_to+ (required) - Id of account (Number)
    # * * +amount+ (required) -  (Number)
    # * * +description+ - (String)
    # * * +tan+ - security number (String)
    def create_tba(params)
      create('tba', params)
    end

    # Create TBU request
    # /api/v1/requests/tbu
    #
    # ==== Attributes
    # * +params+ - hash of params for request,
    # e.g. {user: 'John', account_from: 1, account_to: 2, amount: 5}
    # * * +user+ - Name of the user
    # *Required if request sent by administrator (String)
    # * * +account_from+ (required) - Id of account (Number)
    # * * +account_to+ (required) - Id of account (Number)
    # * * +amount+ (required) -  (Number)
    # * * +description+ - (String)
    # * * +user_to+ (required) -  Name of recipient user (String)
    # * * +tan+ - security number (String)
    def create_tbu(params)
      create('tbu', params)
    end

    # Create CFT request
    # /api/v1/requests/cft
    #
    # ==== Attributes
    # * +params+ - hash of params for request,
    # e.g. {account_from: 1, card_to: 2, amount: 5}
    # * * +account_from+ (required) - Id of account (Number)
    # * * +card_to+ (required) - Id of the card (Number)
    # * * +amount+ (required) -  (Number)
    # * * +description+ - (String)
    # * * +tan+ - security number (String)
    def create_cft(params)
      create('cft', params)
    end

    # Create OWT request
    # /api/v1/requests/owt
    #
    # ==== Attributes
    #
    # * +options+ - hash of options for request,
    # e.g. {perpage: 2, page: 1, sort: 'date'}
    # * * +user+ - Name of the user
    # * * * Required if request sent by administrator (String)
    # * * +account_from+ (required) - Id of account (Number)
    # * * +beneficiary_bank+  (required) - instance of BeneficiaryBank
    # * * +beneficiary_customer+ (required) - instance of BeneficiaryCustomer
    # * * +additional_info+ (required) - instance of AdditionalInfo
    # * * +is_intermediary_bank+ (required) - (Number)
    # * * +intermediary_bank+ - instance of IntermediaryBank
    # * * +amount+ (required) -  (Number)
    # * * +currency+ (required) -  (Number)
    # * * +fee_type+ (required) -  (Number)
    # * * +description+ - (String)
    # * +tan+ - security number (String)
    #
    # ==== Examples
    #
    #   beneficiary_bank =  EbanqApi::BeneficiaryBank.new('swift', 'name', 'address','location','country','abartn')
    #   beneficiary_customer = EbanqApi::BeneficiaryCustomer.new('name', 'address', 'iban')
    #   additional_info = EbanqApi::AdditionalInfo.new('information_ref')
    #   intermediary_bank =  EbanqApi::IntermediaryBank.new('swift', 'name', 'address','location','country','abartn', 'iban')
    #
    #   params = {
    #     user: 'John',
    #     account_from: 1,
    #     beneficiary_bank: beneficiary_bank,
    #     beneficiary_customer: beneficiary_customer,
    #     additional_info: additional_info,
    #     is_intermediary_bank: 0,
    #     intermediary_bank: intermediary_bank,
    #     amount: 1,
    #     currency: 1
    #   }
    #
    #   client.requests.create_owt(params)
    def create_owt(params)
      params[:beneficiary_bank] = params[:beneficiary_bank].to_hash
      params[:beneficiary_customer] = params[:beneficiary_customer].to_hash
      params[:additional_info] = params[:additional_info].to_hash
      params[:intermediary_bank] = params[:intermediary_bank].to_hash

      create('owt', params)
    end

    # Approve one transfer request
    # /api/v1/requests/approve
    #
    # ==== Attributes
    # * +request_id+ (required) - (Number)
    def approve(request_id)
      @client.make_request :post,
                           requests_path('approve'),
                           request_id: request_id
    end

    private

    def create(type, params)
      @client.make_request :post,
                           requests_path(type),
                           params
    end
  end
end
