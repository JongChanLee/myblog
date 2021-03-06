require 'carrierwave/orm/activerecord'

CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
      provider:                'AWS',                        # required
      aws_access_key_id:       ENV['aws_access_key_id'],                        # required
      aws_secret_access_key:   ENV['aws_secret_key'],                        # required
      region:                  'ap-northeast-2',                  # optional, defaults to 'us-east-1'
      endpoint:                'https://s3-ap-northeast-2.amazonaws.com' # optional, defaults to nil
  }
  config.fog_directory  = 'tutankhamen-blog'                     # required
end