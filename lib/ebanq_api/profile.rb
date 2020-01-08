# frozen_string_literal: true

require 'ebanq_api/client'
require 'ebanq_api/api_paths'

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
    def update(uid, params)
      @client.make_request :post,
                           auth_path(uid), params
    end

    # Get list of allowed documents
    # /api/v1/profile/
    def list_of_allowed_documents
      @client.make_request :post, PROFILE_API_PATH
    end
  end
end
