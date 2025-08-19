class VotesController < ApplicationController
  def create
    @conspiracy = Conspiracy.find(params[:conspiracy_id])
    @user = current_user

    vote = @conspiracy.votes.find_by(user: @user)

    if vote
      vote.destroy
      redirect_to @conspiracy
    else
      vote = @conspiracy.votes.build(user: @user)
      if vote.save
        redirect_to @conspiracy
      else
        redirect_to @conspiracy, alert: "Could not save your vote."
      end
    end
  end
end
