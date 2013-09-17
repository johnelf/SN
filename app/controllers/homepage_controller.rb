class HomepageController < ApplicationController

  def show
    @client_id = "977776791"
    @redirect_url = "http://apps.weibo.com/snetwork"

    unless params[:code].nil?
      code = params[:code]
      client_id = "977776791"
      client_secret = "6b1c84bcefcafbf88f08ab22155bd8a7"
      redirect_url = "http://apps.weibo.com/snetwork"
      request_url = "https://api.weibo.com/oauth2/access_token?code=" +
                    "#{code}&client_id=#{client_id}&client_secret=#{client_secret}" +
                    "&grant_type=authorization_code&reirect_url=#{redirect_url}"

      uri = URI.parse(request_url)
      https = Net::HTTP.new(uri.host,uri.port)
      https.use_ssl = true
      req = Net::HTTP::Post.new(uri.path)
      response = https.request(req)

      unless response.nil?
        @body = response.body
      end
    end
  end

end