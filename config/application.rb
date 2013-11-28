require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module SN
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    WeiboOAuth2::Config.api_key = "977776791"
    WeiboOAuth2::Config.api_secret = "6b1c84bcefcafbf88f08ab22155bd8a7"
    WeiboOAuth2::Config.redirect_uri = "http://apps.weibo.com/snetwork/callback"
    #WeiboOAuth2::Config.redirect_uri = "http://127.0.0.1/callback"
  end
end
