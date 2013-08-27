require 'weibo_2'

class WelcomeController < ApplicationController
  include WelcomeHelper

  def index
    oauth = Weibo::OAuth.new(Weibo::Config.api_key, Weibo::Config.api_secret)
    request_token = oauth.consumer.get_request_token
    session[:rtoken], session[:rsecret] = request_token.token, request_token.secret
    redirect_to "#{request_token.authorize_url}&oauth_callback=http://localhost:3000/callback/index"
  end
end
