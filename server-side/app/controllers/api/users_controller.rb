class Api::UsersController < ApplicationController

    def create
        user = User.new(user_params)
        if user.save
            auth_token = auth_token(user.id)
            render json: {token: auth_token, expiresIn: ENV["EXPIRES_IN"], userID: user.id, status: 201}, status: 201
        else
            render json: {error: user.errors.full_messages}, status: 400
        end
    end

    def show
        user = User.find_by(:id=>params[:id])
        if user
            userInfo = {name: user.name, username: user.username, email: user.email}
            render json: {userInfo: userInfo, status: 200}, status: 200
        else
            render json: {error: "There was an error retrieving user information.", status: 404}, status: 404
        end
    end

    def update       
        if user = User.find_by(:id=>user_params["id1"])
            if user.update(user_params)
                userInfo = {name: user.name, username: user.username, email: user.email}
                render json: {success: "Account successfully updated!", userInfo: userInfo, status: 200}, status: 200            
            end
        else
            render json: {fail: "Account did not update", status: 400}, status: 400
        end
    end

    private
    def user_params
        params.require(:user).permit(:id, :email, :password, :name, :username)
    end

    def auth_token(id)
        JsonWebToken.encode({user_id: id})
    end

end
