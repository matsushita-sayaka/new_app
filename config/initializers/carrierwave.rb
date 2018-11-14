CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['ENV_VAR_AWS_ACCESS_KEY'],
    aws_secret_access_key: ENV['ENV_VAR_AWS_SECRET_KEY'],
    region: 'us-east-2'
  }
 
    config.fog_directory  = 'rails-photo-123'
    config.asset_host = "https://s3.ap-northeast-1.amazonaws.com/create-box"
    config.cache_storage = :fog
    
end
