class HomepageController < ApplicationController
  protect_from_forgery :except => :index
  skip_before_filter :verify_authenticity_token

  def show
    logger.info "show..............."
    @client = WeiboOAuth2::Client.new
    if session[:access_token] && !@client.authorized?
      logger.info "in session..............."

      @token = @client.get_token_from_hash({:access_token => session[:access_token], :expires_at => session[:expires_at]})

      unless @token.validated?
        reset_session
        redirect '/connect'
        return
      end
    end

    if session[:uid]
      logger.info "user info...................."
      @user = @client.users.show_by_uid(session[:uid])
      @statuses = @client.statuses
    end
  end

  def connect
    client = WeiboOAuth2::Client.new
    logger.info "========================================"
    logger.info "connect..............."
    redirect client.authorize_url
  end

  def callback
    client = WeiboOAuth2::Client.new

    access_token = client.auth_code.get_token(params[:code].to_s)

    session[:uid] = access_token.params["uid"]
    session[:access_token] = access_token.token
    session[:expires_at] = access_token.expires_at

    @user = client.users.show_by_uid(session[:uid].to_i)

    redirect '/'
  end

end