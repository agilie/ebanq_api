# frozen_string_literal: true

module EbanqApi
  # Configuration module
  # * +base_url+ - http://yourebanqdomain.com
  # * +token+ - user token
  # * +secret+ - user secret
  module Configuration
    OPTIONS = %i[base_url token secret].freeze

    attr_accessor *OPTIONS

    def config
      yield self
    end
  end
end
