class ConspiraciesController < ApplicationController
  def show
    @conspiracy = Conspiracy.find(params[:id])
  end

  def new
    @conspiracy = Conspiracy.new
  end

  def create
    @conspiracy = Conspiracy.new(create_params)
    @user = current_user
    @conspiracy.user = @user
    if @conspiracy.save
      redirect_to conspiracy_path(@conspiracy)
    else
      raise
      render "new", status: :unprocessable_entity
    end
  end

  private
  
  def create_params
    params.require(:conspiracy).permit(:title, :content)
  end
end
