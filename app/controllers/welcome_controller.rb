class WelcomeController < ApplicationController
  def index
    client = WeiboOAuth2::Client.new

    redirect_to client.authorize_url
  end
end
