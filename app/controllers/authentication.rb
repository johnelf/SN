class Authentication

  def authenticate
    unless params[:code].nil?
      code = params[:code]
      client_id = "977776791"
      client_secret = "6b1c84bcefcafbf88f08ab22155bd8a7"
      grant_type = "authorization_code"
      redirect_url = "http://apps.weibo.com/snetwork"

      uri = URI.parse("https://api.weibo.com")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Post.new("/oauth2/access_token")
      request.add_field('Content-Type', 'application/json')
      request.body = {
                      :client_id => client_id,
                      :client_secret => client_secret,
                      :grant_type => grant_type,
                      :code => code,
                      :redirect_url => redirect_url
                     }
      response = http.request(request)

      unless response.nil?
        @body = response.body
      end
    end
  end

end