class HomepageController < ApplicationController
  protect_from_forgery :except => :index
  skip_before_filter :verify_authenticity_token

  def show
    @client = WeiboOAuth2::Client.new
    if session[:access_token] && !@client.authorized?
          return
    end

    if session[:uid]
      puts "user info...................."
      @statuses = @client.statuses
      render :text => "homepage/success", :status => 201
    end

    render :file => "homepage/show", :status => 200
  end

end