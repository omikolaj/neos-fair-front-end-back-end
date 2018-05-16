class Api::UsersController < ApplicationController
    
    # def index
    #     users = User.all
    #     render json: users, status: 200
    # end

    # def show
    #     user = User.all.first
        
    #     render json: user, status: 200, include: '**'
    # end

    def create
        user = User.new(user_params)
        if user.save
            render json: {status: "User created successfully"}, status: 201
        else
            render json: {error: user.errors.full_messages}, status: 400
        end
    end

    def login
        binding.pry
        user = User.find_by(:username => params[:username])
        if user && user.authenticate(params[:password])
            auth_token = JsonWebToken.encode({user_id: user.id})
            render json: {token: auth_token, expiresIn: 10800, userID: user.id, status: 200}, status: 200
        else
            render json: {error: 'Invalid username / password', status: 401}, status: 401
        end
    end

    private
    def user_params
        params.require(:user).permit(:email, :password, :first_name, :last_name, :username)
    end

end
