class CallbackController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def callback

    puts "callback............."
    client = WeiboOAuth2::Client.new

    access_token = client.auth_code.get_token(params[:code].to_s)

    session[:uid] = access_token.params["uid"]
    session[:access_token] = access_token.token
    session[:expires_at] = access_token.expires_at

    @user = client.users.show_by_uid(session[:uid].to_i)

    redirect_to '/'
  end

end