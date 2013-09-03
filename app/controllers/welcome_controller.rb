class WelcomeController < ApplicationController
  def index
    client = WeiboOAuth2::Client.new
    client.authorize_url
  end
end
