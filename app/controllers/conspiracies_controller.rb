class ConspiraciesController < ApplicationController

  def index
    @conspiracies = Conspiracy.all
  end

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
