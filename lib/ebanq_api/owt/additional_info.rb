# frozen_string_literal: true

require 'ebanq_api/owt/common'

# AdditionalInfo class
module EbanqApi
  ##
  # This class represents an additional info functional
  # of Ebanq REST Api for owt request.
  #
  # ==== Attributes
  # * +information_ref+ - string
  class AdditionalInfo
    include Common
    attr_accessor :information_ref

    def initialize(information_ref = '')
      @information_ref = information_ref
    end
  end
end
