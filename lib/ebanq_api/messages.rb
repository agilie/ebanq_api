# frozen_string_literal: true

require 'ebanq_api/client'
require 'ebanq_api/api_paths'

module EbanqApi
  ##
  # This class represents an profile functional of Ebanq REST Api.
  class Messages
    include ApiPaths
    # Declares an client instance.
    def initialize(client)
      @client = client
    end

    # List of all incoming messages
    # /api/v1/messages
    #
    # ==== Attributes
    #
    # * +options+ - hash of options for request, e.g. {page: 1, per_page: 2, order: 'last_update'}
    # * * +page+ - Number of page with messages. (Number)
    # * * +per_page+ - Count messages per page. (Number)
    # * * +order+ - Sorting for messages list. Allowed values: last_update, subject. (String)
    # * * +sort+ - Order of sorting for messages list. Allowed values: asc, desc.
    # * * +search+ - Part of subject of text of messages for search. (String)
    def list(options = {})
      @client.make_request :get, messages_path, options
    end

    # Retrieve a message
    # /api/v1/messages/{id}
    #
    # ==== Attributes
    # * +id+ (required) - Message id (Number)
    def show(id)
      @client.make_request :get, messages_path(id)
    end

  end
end
