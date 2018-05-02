class Api::UsersController < ApplicationController

    def index
        users = User.all
        render json: users, status: 200
    end

    def show
        user = User.all.first
        
        render json: user, status: 200, include: '**'
    end
end
