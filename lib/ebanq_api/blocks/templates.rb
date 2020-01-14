# frozen_string_literal: true

require 'ebanq_api/client'
require 'ebanq_api/api_paths'

# Templates block
module EbanqApi
  ##
  # This class represents an templates functional of Ebanq REST Api.
  class Templates
    include ApiPaths
    # Declares an client instance.
    def initialize(client)
      @client = client
    end

    # Get list of all templates
    # /api/v1/templates
    #
    # ==== Examples
    #
    #   client.templates.list
    def list
      @client.make_request :get, templates_path
    end

    # Retrieve a Transfer Request template
    # /api/v1/templates/{id}
    #
    # ==== Attributes
    #
    # * +id+ (required) - The id of the template to retrieve. (Number)
    #
    # ==== Examples
    #
    #   client.templates.show(1)
    def show(id)
      @client.make_request :get, templates_path(id)
    end

    # List of all request templates tbu
    # /api/v1/templates/tbu
    #
    # ==== Examples
    #
    #   client.templates.tbu
    def tbu
      @client.make_request :get, templates_path('tbu')
    end

    # List of all request templates cft
    # /api/v1/templates/cft
    #
    # ==== Examples
    #
    #   client.templates.cft
    def cft
      @client.make_request :get, templates_path('cft')
    end

    # List of all request templates owt
    # /api/v1/templates/owt
    #
    # ==== Examples
    #
    #   client.templates.owt
    def owt
      @client.make_request :get, templates_path('owt')
    end

    # Create a Transfer Request template
    # /api/v1/templates
    #
    # ==== Examples
    #
    #   client.templates.create
    # @return {}
    def create
      @client.make_request :put, templates_path
    end

    # Delete a Transfer Request Template
    # /api/v1/templates/{id}
    #
    # ==== Attributes
    #
    # * +id+ (required) - The id of the template to retrieve. (Number)
    #
    # ==== Examples
    #
    #   client.templates.delete(1)
    def delete(id)
      @client.make_request :delete, templates_path(id)
    end
  end
end
