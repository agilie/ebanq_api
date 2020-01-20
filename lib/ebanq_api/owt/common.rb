# frozen_string_literal: true

# Common owt block helpers
module EbanqApi
  ##
  # Common owt block helpers
  module Common
    # Transform object to hash
    def to_hash
      instance_variables.each_with_object({}) do |var, hash|
        hash[var.to_s.delete('@')] = instance_variable_get(var)
      end
    end
  end
end
