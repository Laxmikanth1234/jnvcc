Recaptcha.configure do |config|
  config.site_key  = ENV.fetch('CAPTCHA_SITE_KEY')
  config.secret_key = ENV.fetch('CAPTCHA_SECRET_KEY')
end