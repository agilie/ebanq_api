# frozen_string_literal: true

require 'ebanq_api/version'
require 'ebanq_api/client'
require 'ebanq_api/blocks/registration'
require 'ebanq_api/blocks/auth'
require 'ebanq_api/blocks/profile'
require 'ebanq_api/blocks/accounts'
require 'ebanq_api/blocks/news'
require 'ebanq_api/blocks/messages'
require 'ebanq_api/blocks/cards'
require 'ebanq_api/blocks/requests'
require 'ebanq_api/blocks/reports'
require 'ebanq_api/blocks/settings'
require 'ebanq_api/blocks/templates'
require 'ebanq_api/blocks/transactions'
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
