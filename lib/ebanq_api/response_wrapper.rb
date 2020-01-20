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
      response.is_a?(Hash) ? OpenStruct.new(response) : response
    end
  end
end
