class VotesController < ApplicationController
  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.new
    @conspiracy = Conspiracy.find(params[:id])
    @user = current_user
    @vote.conspiracy = @conspiracy
    @vote.user = @user
    if vote.save
      if
  end
end
