# frozen_string_literal: true

require 'ebanq_api/owt/common'

module EbanqApi
  ##
  # This class represents an beneficiary bank functional
  # of Ebanq REST Api for owt request.
  #
  # ==== Attributes
  # * +swift+ - string
  # * +name+ - string
  # * +address+ - string
  # * +location+ - string
  # * +country+ - string
  # * +abartn+ - string
  class BeneficiaryBank
    include Common
    attr_accessor :swift, :name, :address, :location, :country, :abartn

    def initialize(swift = '', name = '', address = '', location = '', country = '', abartn = '')
      @swift = swift
      @name = name
      @address = address
      @location = location
      @country = country
      @abartn = abartn
    end
  end
end
