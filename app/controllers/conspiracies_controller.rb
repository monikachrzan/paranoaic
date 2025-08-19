class ConspiraciesController < ApplicationController

  def show
    @conspiracy = Conspiracy.find(params[:id])
  end
end
