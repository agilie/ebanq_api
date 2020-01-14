# frozen_string_literal: true

require 'ebanq_api/client'
require 'ebanq_api/api_paths'

# Cards block
module EbanqApi
  ##
  # This class represents an cards functional of Ebanq REST Api.
  class Cards
    include ApiPaths
    # Declares an client instance.
    def initialize(client)
      @client = client
    end

    # Retrieve a Card
    # /api/v1/cards/{id}/
    # ==== Attributes
    #
    # * +id+ (required) - The ID of the card to retrieve. (Number)
    def show(id)
      @client.make_request :get, cards_path(id)
    end

    # List all cards belonging to user
    # /api/v1/cards
    #
    # @return Array
    def list
      @client.make_request :get, cards_path
    end
  end
end
