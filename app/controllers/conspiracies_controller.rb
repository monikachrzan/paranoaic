class ConspiraciesController < ApplicationController
  def show
    @conspiracy = Conspiracy.find(params[:id])
  end

  def new
    @conspiracy = Conspiracy.new
  end

  def create
    @conspiracy = Conspiracy.new(create_strong_params)
    @user = current_user
    @conspiracy.user = @user
    if @conspiracy.save
      redirect_to conspiracy_path(@conspiracy)
    else
      render "new", status: :unprocessable_entity
    end
  end

  private

  def create_strong_params
    params.require(:conspiracy).permit(:title, :content)
  end
end
