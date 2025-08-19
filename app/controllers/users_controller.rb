class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @conspiracies = @user.conspiracies
  end
end
