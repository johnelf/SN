class HomepageController < ApplicationController
  #protect_from_forgery :except => :index
  #skip_before_filter :verify_authenticity_token

  def show
    @client = WeiboOAuth2::Client.new

    if session[:uid]
      puts "user info...................."
      @user = @client.users.show_by_uid(session[:uid])
      @statuses = @client.statuses
    end
  end

end