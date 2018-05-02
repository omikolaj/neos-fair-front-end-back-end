class Api::UsersController < ApplicationController

    def index
        binding.pry
        users = User.all
        render json: users, status: 200
    end
end
