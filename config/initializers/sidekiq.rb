Sidekiq.configure_server do |config|
  config.redis = { url: ENV.fetch('REDIS_URL'), ssl_params: { verify_mode: OpenSSL::SSL::VERIFY_NONE } }
  config.on(:startup) do
    case Rails.env
    when 'production'
      schedule_file = 'config/schedule_production.yml'
    when 'staging'
      schedule_file = 'config/schedule_staging.yml'
    when 'development'
      schedule_file = 'config/schedule_development.yml'
    end

    Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file) if File.exist?(schedule_file)
  end
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV.fetch('REDIS_URL'), ssl_params: { verify_mode: OpenSSL::SSL::VERIFY_NONE } }
end
