Sidekiq.configure_server do |config|
  config.on(:startup) { ActiveRecord::Base.clear_active_connections! }
  config.redis = { url: ENV['REDIS_URL'] }
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV['REDIS_URL'] }
end
