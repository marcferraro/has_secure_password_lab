class UsersController < ApplicationController

    def create
        # byebug
        @user = User.create(user_params)
        return redirect_to '/users/new' unless @user.save
        session[:user_id] = @user.id
    end

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
