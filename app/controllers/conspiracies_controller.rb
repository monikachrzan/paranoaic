class ConspiraciesController < ApplicationController

  def show
    @user = User.find(params[:user_id])
    @conspiracy = @user.conspiracies.find(params[:id])
  end

  def new
    @conspiracy = Conspiracy.new
  end

  def create
    raise
  end
end
