# frozen_string_literal: true

require 'ebanq_api/client'
require 'ebanq_api/api_paths'

# Profile block
module EbanqApi
  ##
  # This class represents an profile functional of Ebanq REST Api.
  class Profile
    include ApiPaths
    # Declares an client instance.
    def initialize(client)
      @client = client
    end

    # Get user profile data.
    # /api/v1/auth/{uid}
    #
    # ==== Attributes
    #
    # * +uid+ (required) - The id of the user (Number)
    #
    # ==== Examples
    #
    #   client.profile.show(1)
    def show(uid)
      @client.make_request :get, auth_path(uid)
    end

    # Update user profile data
    # /api/v1/auth/{uid}
    #
    # ==== Attributes
    #
    # * +uid+ (required) - The id of the user (Number)
    # * +params+ (required) - hash of params which needs to update,
    # e.g. {first_name: 'John', last_name: 'Doe'}
    #
    # ==== Examples
    #
    #   client.profile.update(1,  first_name: 'John' )
    def update(uid, params)
      @client.make_request :post,
                           auth_path(uid), params
    end

    # Get list of allowed documents
    # /api/v1/profile/
    #
    # ==== Examples
    #
    #   client.profile.list_of_allowed_documents
    # @return Array
    def list_of_allowed_documents
      @client.make_request :get, profile_path
    end
  end
end
