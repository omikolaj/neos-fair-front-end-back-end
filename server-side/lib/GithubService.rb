class GitHubService

  def fetch_access_token(code)
    resp = Faraday.post(ENV['GITHUB_ACCESS_TOKEN_URL']) do |req|        
      req.params["client_id"] = ENV['GITHUB_ID']
      req.params["client_secret"] = ENV['GITHUB_SECRET']
      req.params["code"] = code
      req.headers["Accept"] = 'application/json'
    end
    JSON.parse(resp.body)["access_token"]         
  end

end