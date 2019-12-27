# frozen_string_literal: true

module EbanqApi
  module Configuration

    OPTIONS = %i[base_url token secret].freeze

    attr_accessor *OPTIONS

    def config
      yield self
    end

  end
end
