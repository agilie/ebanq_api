# frozen_string_literal: true

# IntermediaryBank class
module EbanqApi
  ##
  # This class represents an intermediary bank functional
  # of Ebanq REST Api for owt request.
  #
  #
  # ==== Attributes
  # * +swift+ - string
  # * +name+ - string
  # * +address+ - string
  # * +location+ - string
  # * +country+ - string
  # * +abartn+ - string
  # * +iban+ - string
  class IntermediaryBank < BeneficiaryBank
    attr_accessor :iban

    def initialize(swift = '', name = '', address = '', location = '',
                   country = '', abartn = '', iban = '')
      super(swift, name, address, location, country, abartn)
      @iban = iban
    end
  end
end
