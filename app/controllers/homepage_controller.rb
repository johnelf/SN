class HomepageController < ApplicationController
  protect_from_forgery :except => :index
  skip_before_filter :verify_authenticity_token

  def show
    @client = WeiboOAuth2::Client.new
    if session[:access_token] && !@client.authorized?

      @token = @client.get_token_from_hash({:access_token => session[:access_token], :expires_at => session[:expires_at]})

      unless @token.validated?
        reset_session
        redirect_to '/connect'
        return
      end
    end

    if session[:uid]
      puts "user info...................."
      @user = @client.users.show_by_uid(session[:uid])
      @statuses = @client.statuses
    end
  end

  def connect
    client = WeiboOAuth2::Client.new

    redirect client.authorize_url
  end

end