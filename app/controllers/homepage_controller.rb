class HomepageController < ApplicationController

  def show
    @client_id = "977776791"
    @redirect_url = "http://apps.weibo.com/snetwork"
  end

  def authenticate
    unless params[:code].nil?
      code = params[:code]
      request_url = "https://api.weibo.com/oauth2/access_token?code=#{code}&client_id=977776791&client_secret=6b1c84bcefcafbf88f08ab22155bd8a7&grant_type=authorization_code&redirect_uri=http://apps.weibo.com/snetwork"

      uri = URI.parse(request_url)
      https = Net::HTTP.new(uri.host,uri.port)
      https.use_ssl = true
      req = Net::HTTP::Post.new(uri.path)
      req['Content-Type'] = 'application/json'
      req['Accept'] = 'application/json'
      response = https.request(req)

      unless response.nil?
        @body = response.body
      end
    end
  end

end