class UsersController < ApplicationController
  def new
    @title="Signup"
    @user= User.new
  end
  def show
    @user = User.find(params[:id])
  end
  def create
    @user= User.new
    render 'new'

  end
end
