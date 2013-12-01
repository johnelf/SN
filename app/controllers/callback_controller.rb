class CallbackController < ApplicationController
  protect_from_forgery
  skip_before_action :verify_authenticity_token

  def callback
    client = WeiboOAuth2::Client.new

    code = params[:code]
    access_token = client.auth_code.get_token(code.to_s)

    session[:uid] = access_token.params["uid"]
    session[:access_token] = access_token.token
    session[:expires_at] = access_token.expires_at

    @user = client.users.show_by_uid(session[:uid].to_i)

    @statuses = client.statuses

  end

end