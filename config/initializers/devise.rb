require 'devise/jwt'

Devise.setup do |config|

  config.secret_key = '098d3d76b8fff0cd4ea9ac30daa4254b9f942128146a359a8c164fe889f7d3b5b4859c560e5ff3707fcee940d76dc6be265daeb7b3576321135be47b05dd4957'

  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'

  require 'devise/orm/active_record'

  config.case_insensitive_keys = [:email]

  config.strip_whitespace_keys = [:email]

  config.skip_session_storage = [:http_auth, :params_auth]

  config.stretches = Rails.env.test? ? 1 : 11

  config.reconfirmable = true

  config.expire_all_remember_me_on_sign_out = true

  config.password_length = 6..128

  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/

  config.reset_password_within = 6.hours

  config.sign_out_via = :delete

  config.jwt do |jwt|
    jwt.secret = '6c04ed1fa7a8c16bc97f1747acaf52136e77c668b0bfeaee8a17327ae7c2b26af2f4b931a967a2e20678c9eeddd30954d06e7d1ca6ebb3d0638004fff2efff75'
    jwt.dispatch_requests = [
        ['POST', %r{^/login$}]
    ]
    jwt.revocation_requests = [
        ['DELETE', %r{^/logout$}]
    ]
    jwt.expiration_time = 1.day.to_i
  end

  config.navigational_formats = []
end
