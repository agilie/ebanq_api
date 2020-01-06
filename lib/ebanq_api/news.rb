# frozen_string_literal: true

require 'ebanq_api/client'
require 'ebanq_api/api_paths'

module EbanqApi
  ##
  # This class represents an profile functional of Ebanq REST Api.
  class News
    include ApiPaths
    # Declares an client instance.
    def initialize(client)
      @client = client
    end

    # Retrieve News entry
    # /api/v1/news/{id}
    # ==== Attributes
    #
    # * +id+ (required) - he ID of the news to retrieve. (Number)
    def show(uid)
      @client.make_request :get, news_path(uid)
    end

    # List of all News entries
    # /api/v1/news
    #
    # ==== Attributes
    # * +page+ - Page number. (Number)
    def list(page = 1)
      values = {
        page: page
      }
      @client.make_request :get, news_path, values
    end

  end
end
