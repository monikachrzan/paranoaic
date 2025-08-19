class ConspiraciesController < ApplicationController

  def show
    @conspiracy = Conspiracy.find(params[:id])
  end

  def new
    @conspiracy = Conspiracy.new
  end

  def create
    raise
  end
end
