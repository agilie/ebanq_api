# frozen_string_literal: true

module EbanqApi
  # BadRequest exception class.
  class BadRequest < StandardError
  end

  # Forbidden exception class.
  class Forbidden < StandardError
  end

  # NotFound exception class.
  class NotFound < StandardError
  end

  # NotAcceptable exception class.
  class NotAcceptable < StandardError
  end

  # TooManyRequests exception class.
  class TooManyRequests < StandardError
  end

  # InternalServerError exception class.
  class InternalServerError < StandardError
  end

  # BadGateway exception class.
  class BadGateway < StandardError
  end

  # ServiceUnavailable exception class.
  class ServiceUnavailable < StandardError
  end

  # GatewayTimeout exception class.
  class GatewayTimeout < StandardError
  end

  # InvalidSignature exception class.
  class InvalidSignature < StandardError
  end

  # RateLimitExceeded exception class.
  class RateLimitExceeded < StandardError
  end
end
