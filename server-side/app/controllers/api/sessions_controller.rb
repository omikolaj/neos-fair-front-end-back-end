class Api::SessionsController < ActionController::Base
	require 'GithubService'
  
	def login
	    user = User.find_by(:username => params[:session][:user][:username])
		if user && user.authenticate(params[:session][:user][:password])
        	auth_token = auth_token(user.id)
        	render json: {token: auth_token, expiresIn: ENV["EXPIRES_IN"], userID: user.id, status: 200}, status: 200
    	else
	        render json: {error: 'Invalid username / password', status: 401}, status: 401
	    end
	end

	def guest
    	user = User.find_by(:id => 1)
    	if user
	        auth_token = auth_token(user.id)
        	render json: {token: auth_token, expiresIn: ENV["EXPIRES_IN"], userID: user.id, status: 200}, status: 200
    	else
	        render json: {error: 'User was not found', status: 401}, status: 401
	    end        
	end

	def github
		github = GithubService.new
		user_hash = github.user_info(params[:code])
		user = User.find_or_create_by_oauth(user_hash)
		if user
			token = auth_token(user.uid)
			redirect_to "#{ENV["NEOS_FAIR_CLIENT_URL"]}/ads?token=#{token}&expiresIn=#{ENV["EXPIRES_IN"]}&id=#{user.id}"
		else
			redirect_to "#{ENV["NEOS_FAIR_CLIENT_URL"]}?error=error"
		end
	end

	private
	def auth_token(id)
	    JsonWebToken.encode({user_id: id})
	end
end