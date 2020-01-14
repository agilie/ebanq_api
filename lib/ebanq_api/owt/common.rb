# frozen_string_literal: true

# Common helpers
module EbanqApi
  ##
  # Common helpers
  module Common
    # Transform object to hash
    def to_hash
      instance_variables.each_with_object({}) do |var, hash|
        hash[var.to_s.delete('@')] = instance_variable_get(var)
      end
    end
  end
end
