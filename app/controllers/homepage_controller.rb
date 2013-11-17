class HomepageController < ApplicationController
  protect_from_forgery :except => :index
  skip_before_filter :verify_authenticity_token

  def show
    @client_id = "977776791"
    @redirect_url = "http://apps.weibo.com/snetwork"

    unless params[:code].nil?
      @code = params[:code]

      client = WeiboOAuth2::Client.new

      client.authorize_url

      @access_token = client.auth_code.get_token(@code)

    end
  end

end