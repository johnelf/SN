require 'date'

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
    time_line = client.users.timeline
    @user_time_line = Hash.new
    time_line.statuses.each do |status|
      time = /\w+ (\w+) (\d+) [:0-9]+ \+0800 (\d+)/.match(status.created_at)
      date = a[3] + DateUtiles.month_to_number[time[1]] + a[2]
      if @user_time_line[date].nil?
        @user_time_line[date] = 1
      else
        sum = @user_time_line[date]
        @user_time_line[date] = sum.to_i + 1
      end
    end
    gon.time_line = @user_time_line
    @friends = client.friendships.friends(:uid => @user.id.to_s)

  end

end