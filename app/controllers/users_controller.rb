class UsersController < ApplicationController
  def new
    @title="Signup"
  end
  def show
    @user = User.find(1)
  end
end
