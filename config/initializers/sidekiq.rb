require 'sidekiq/web'


# Configure Sidekiq-specific session middleware
Sidekiq::Web.use ActionDispatch::Cookies
Sidekiq::Web.use ActionDispatch::Session::CookieStore, key: "_interslice_session"

# config/initializers/sidekiq.rb
schedule_file = "config/schedule.yml"
if File.exist?(schedule_file) && Sidekiq.server?
  Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV.fetch("REDISTOGO_URL"), size: 10, network_timeout: 5 }
end

Sidekiq.configure_server do |config|
  config.redis = { url: ENV.fetch("REDISTOGO_URL"), size: 12, network_timeout: 5 }
end

Sidekiq::Extensions.enable_delay!