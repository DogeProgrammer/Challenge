# frozen_string_literal: true

module ValidEmailGenerator
  def self.generate(prefix = 'info+', host_validation = :mx)
    email_address = ''

    loop do
      email_address = "#{prefix}#{SecureRandom.urlsafe_base64}@csg.com"
      break if EmailAddress.valid?(email_address, host_validation:)
    end

    email_address
  end
end
