class WelcomeController < ApplicationController
  def index
    client = WeiboOAuth2::Client.new
    client.authorize_url

    redirect_to "/callback/index"
  end
end
