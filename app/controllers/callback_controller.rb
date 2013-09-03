class CallbackController < ApplicationController
  def index
    client = WeiboOAuth2::Client.new
    client.authorize_url
    p client.auth_code.get_token(params[:code])

  end
end
