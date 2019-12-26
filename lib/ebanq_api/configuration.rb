# frozen_string_literal: true

module EbanqApi
  module Configuration

    OPTIONS = [
      :base_url
    ].freeze

    attr_accessor *OPTIONS

    def config
      yield self
    end

  end
end
