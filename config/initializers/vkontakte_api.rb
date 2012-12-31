VkontakteApi.configure do |config|
  # Authorization parameters (not needed when using an external authorization):
  config.app_id = '3329964'#ENV['APP_ID']
  config.app_secret = 'uot1Y1vWBDhilquG9pnH'#ENV['APP_SECRET']
  config.redirect_uri = "http://todo-skarm.herokuapp.com/callback" #ENV['REDIRECT_URI']
  
  # Faraday adapter to make requests with:
  # config.adapter = :net_http
  
  # Logging parameters:
  # log everything through the rails logger
  config.logger = Rails.logger
  
  # log requests' URLs
  # config.log_requests = true
  
  # log response JSON after errors
  # config.log_errors = true
  
  # log response JSON after successful responses
  # config.log_responses = false
end