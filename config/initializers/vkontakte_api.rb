VkontakteApi.configure do |config|
  # Authorization parameters (not needed when using an external authorization):
  #config.app_id = 'APP_ID' #ENV['APP_ID']
  #config.app_secret = 'APP_SECRET' #ENV['APP_SECRET']
  config.redirect_uri ='http://todo-skarm.herokuapp.com/callback' #"http://109.87.116.232:3000/callback" #ENV['REDIRECT_URI']
  
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