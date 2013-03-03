OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '113042158853320', '7519342784a540da66556dc48562d3c1'
end
