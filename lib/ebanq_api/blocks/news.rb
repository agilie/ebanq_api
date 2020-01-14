# frozen_string_literal: true

require 'ebanq_api/client'
require 'ebanq_api/api_paths'

# News block
module EbanqApi
  ##
  # This class represents an news functional of Ebanq REST Api.
  class News
    include ApiPaths
    # Declares an client instance.
    def initialize(client)
      @client = client
    end

    # Retrieve News entry
    # /api/v1/news/{id}
    #
    # ==== Attributes
    #
    # * +id+ (required) - the ID of the news to retrieve. (Number)
    #
    # ==== Examples
    #
    #   client.news.show(5)
    def show(id)
      @client.make_request :get, news_path(id)
    end

    # List of all News entries
    # /api/v1/news
    #
    # ==== Attributes
    #
    # * +options+ - hash of options for request, e.g. {page: 1}
    # * * +page+ - Page number. (Number)
    #
    # ==== Examples
    #
    #   client.news.list
    def list(options = {})
      @client.make_request :get, news_path, options
    end
  end
end
