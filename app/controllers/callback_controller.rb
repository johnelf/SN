class CallbackController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def callback
    puts "hey call me back!"
    client = WeiboOAuth2::Client.new

    code = params[:code]
    access_token = client.auth_code.get_token(code.to_s)

    puts "============================="
    puts access_token.inspect
    puts "============================="

    session[:uid] = access_token.params["uid"]
    session[:access_token] = access_token.token
    session[:expires_at] = access_token.expires_at

    @user = client.users.show_by_uid(session[:uid].to_i)

    respond_with :text => "success", :status => 201
  end

end