class CallbackController < ApplicationController
  def index
    client = WeiboOAuth2::Client.new
    access_token = client.auth_code.get_token(params[:code].to_s)
    session[:uid] = access_token.params["uid"]
    session[:access_token] = access_token.token
    session[:expires_at] = access_token.expires_at

    if session[:access_token] && !client.authorized?
      token = client.get_token_from_hash({:access_token => session[:access_token], :expires_at => session[:expires_at]})

      unless token.validated?
        reset_session
        redirect client.authorize_url
        return
      end
    end

    if session[:uid]
      @user = client.users.show_by_uid(session[:uid].to_i)
      @statuses = client.statuses
    end
  end
end
