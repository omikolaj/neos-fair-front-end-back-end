class Api::SessionsController < ActionController::Base
	require 'GitHubService'
  
	def login
	    user = User.find_by(:username => params[:session][:user][:username])
		if user && user.authenticate(params[:session][:user][:password])
        	auth_token = auth_token(user.id)
        	render json: {token: auth_token, expiresIn: 10800, userID: user.id, status: 200}, status: 200
    	else
	        render json: {error: 'Invalid username / password', status: 401}, status: 401
	    end
	end

	def guest
    	user = User.find_by(:id => 1)
    	if user
	        auth_token = auth_token(user.id)
        	render json: {token: auth_token, expiresIn: 10800, userID: user.id, status: 200}, status: 200
    	else
	        render json: {error: 'User was not found', status: 401}, status: 401
	    end        
	end

	def github
		github = GithubService.new
		token = github.fetch_access_token(params[:code])
		binding.pry	

	end

	private
	def auth_token(id)
	    JsonWebToken.encode({user_id: id})
	end
end