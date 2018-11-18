CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    region: ENV['AWS_REGION']
  }

  # config.fog_directory  = 'create-box'
  # config.cache_storage = :fog
  
    case Rails.env
      when 'development'
          config.fog_directory  = 'create-box'
          config.asset_host = 'https://s3.amazonaws.com/create-box'
      when 'production'
          config.fog_directory  = 'create-box'
          config.asset_host = 'https://s3.amazonaws.com/create-box'
    end
end