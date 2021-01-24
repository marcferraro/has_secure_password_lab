class SessionsController < ApplicationController
  def new
  end

  def create
    # byebug
    @user = User.find_by(name: params[:user][:name])
    # byebug
    return head(:forbidden) unless @user.authenticate(params[:user][:password])
    # byebug
    session[:user_id] = @user.id
  end
end
