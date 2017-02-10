# config/initializers/carrierwave.rb

Carrierwave.configure do |config|
  config.fog_credentials = {
    :provider                => 'AWS',
    :aws_access_key_id       => ENV["AKIAI63KVHPTGAMWMQZA"],
    :aws_secret_access_key   => ENV["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"]
  }
  config.fog_directory = ENV["davidchu34"]
end