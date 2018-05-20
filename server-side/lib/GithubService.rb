class GithubService

  def user_info(code)
    access_token = fetch_access_token(code)
    user_data = fetch_user_info(access_token)
  end
  
  private
  def fetch_access_token(code)
    resp = Faraday.post(ENV['GITHUB_ACCESS_TOKEN_URL']) do |req|        
      req.params["client_id"] = ENV['GITHUB_ID']
      req.params["client_secret"] = ENV['GITHUB_SECRET']
      req.params["code"] = 'asd' #code
      req.headers["Accept"] = 'application/json'
    end
    JSON.parse(resp.body)["access_token"]         
  end

  def fetch_user_info(access_token)
    resp = Faraday.get(ENV['GITHUB_USER_INFO_URL']) do |req|
      req.params["access_token"] = access_token
    end
    JSON.parse(resp.body)
  end

end