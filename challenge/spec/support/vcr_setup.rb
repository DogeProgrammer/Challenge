# frozen_string_literal: true

VCR.configure do |c|
  c.allow_http_connections_when_no_cassette = true
  c.ignore_localhost = true
  c.ignore_hosts 'csg.com',
                 c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
  c.default_cassette_options = { record: :none } if ENV['GITLAB_CI'].present? # the default is :once
end
