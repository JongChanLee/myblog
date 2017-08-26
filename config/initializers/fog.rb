CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
      provider:              'AWS',                        # required
      aws_access_key_id:     ENV["aws_access_key_id"],                        # required
      aws_secret_access_key: ENV["aws_secret_key"],                        # required
      region:                'ap-northeast-2',             # 아시아-한국서버 명칭
      endpoint:              'https://s3-ap-northeast-2.amazonaws.com' # 아시아-한국서버
  }
  config.fog_directory  = 'tutankhamen-blog'                          # required
  config.fog_public     = true                                        # optional, defaults to true
  config.fog_attributes = { } # optional, defaults to {}
end

