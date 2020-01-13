# frozen_string_literal: true

require 'ebanq_api/owt/common'

# BeneficiaryCustomer class
module EbanqApi
  ##
  # This class represents an beneficiary customer functional
  # of Ebanq REST Api for owt request.
  #
  # ==== Attributes
  # * +name+ - string
  # * +address+ - string
  # * +iban+ - string
  class BeneficiaryCustomer
    include Common
    attr_accessor :name, :address, :iban

    def initialize(name = '', address = '', iban = '')
      @name = name
      @address = address
      @iban = iban
    end
  end
end
