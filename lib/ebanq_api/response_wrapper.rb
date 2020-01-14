# frozen_string_literal: true

# Api response wrapper
module EbanqApi
  # Provides a helpers for wrapping of Ebanq API responses
  module ResponseWrapper
    # Transform Ebanq API response to OpenStruct data structure
    # in case it is a hash.
    # Otherwise returns ruby array etc.
    #
    # ==== Attributes
    #
    # * +response+ - response from EbanqAPI
    def wrap(response)
      if response.is_a?(Hash)
        response.keys.each { |key| response[key] = wrap(response[key]) }
        wrap_hash(response)
      elsif response.is_a?(Array)
        response.map(&method(:wrap_hash))
      else
        response
      end
    end

    private

    def wrap_hash(response)
      response.is_a?(Hash) ? OpenStruct.new(response) : response
    end
  end
end
