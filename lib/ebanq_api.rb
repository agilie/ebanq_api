# frozen_string_literal: true

require 'ebanq_api/version'
require 'ebanq_api/client'
require 'ebanq_api/auth'
require 'ebanq_api/profile'
require 'ebanq_api/accounts'
require 'ebanq_api/news'
require 'ebanq_api/messages'
require 'ebanq_api/cards'
require 'ebanq_api/requests'
require 'ebanq_api/reports'
require 'ebanq_api/configuration'
require 'ebanq_api/api_paths'
require 'ebanq_api/owt/additional_info'
require 'ebanq_api/owt/beneficiary_bank'
require 'ebanq_api/owt/beneficiary_customer'
require 'ebanq_api/owt/intermediary_bank'
require 'ebanq_api/response_wrapper'

# Provides configuration variables.
module EbanqApi
  extend Configuration
end
