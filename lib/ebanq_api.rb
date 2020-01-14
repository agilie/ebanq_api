# frozen_string_literal: true

require 'ebanq_api/version'
require 'ebanq_api/client'
require 'ebanq_api/auth'
require 'ebanq_api/profile'
require 'ebanq_api/accounts'
require 'ebanq_api/news'
require 'ebanq_api/messages'
require 'ebanq_api/configuration'
require 'ebanq_api/api_paths'

# Provides configuration variables.
module EbanqApi
  extend Configuration
end
