# frozen_string_literal: true

require 'ebanq_api/client'
require 'ebanq_api/api_paths'

# Registration block
module EbanqApi
  ##
  # This class represents an registration functional of Ebanq REST Api.
  class Registration
    include ApiPaths
    # Declares an client instance.
    def initialize(client)
      @client = client
    end

    # Create a new regular user profile by bank-admin
    # /api/v1/registration/create
    #
    # ==== Attributes
    #
    # * +options+ - hash of options for request
    # * * +name+ (required) - (String)
    # * * +pass+ (required) - (String)
    # * * +mail+ (required) - (String)
    # * * +field_user_confirm_email_address+ (required) -
    # equals to mail param (String)
    # * * +field_user_first_name+ (required) - (String)
    # * * +field_user_last_name+ (required) - (String)
    # * * +field_user_status+ (required) - (Number)
    # Allowed values: -1 - Inactive, 0 - Pending, 1- Active, 2 - Dormant.
    # * * +field_profile_type+ (required) - (Number)
    # Allowed values: 0 - Personal, 1 - Corporate
    # * * +field_user_company_name+ - (String)
    # Required if field_profile_type == 1
    # For setting other optional params please check
    # https://ebanqapi.docs.apiary.io/#reference/registration/apiv1registrationcreate/create-a-new-regular-user-profile-by-bank-admin
    # and add them to options hash.
    #
    # ==== Examples
    #
    #   options = (name: 'JohnDoe',
    #   pass: '123456',
    #   mail: 'sajaja1995@etopmail.com',
    #   field_user_confirm_email_address: 'sajaja1995@etopmail.com',
    #   field_user_first_name: 'John',
    #   field_user_last_name: 'Doe',
    #   field_user_status: 1,
    #   field_profile_type: 0)
    #   client.registration.create(options)
    def create(options = {})
      @client.make_request :post, registration_path('create'), options
    end
  end
end
