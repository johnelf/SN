class WelcomeController < ApplicationController
  def index
    client = WeiboOAuth2::Client.new

    @auth_url = client.authorize_url
  end
end
