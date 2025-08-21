class VotesController < ApplicationController
  def create
    if user_signed_in?
      @conspiracy = Conspiracy.find(params[:conspiracy_id])
      @user = current_user

      vote = @conspiracy.votes.find_by(user: @user)

      if vote
        vote.destroy
        respond_to do |format|
          format.turbo_stream { render turbo_stream: turbo_stream.replace("conspiracy-vote-#{@conspiracy.id}", partial: "shared/vote_btn", locals: { conspiracy: @conspiracy }) }
          format.html { render "conspiracy-vote-#{@conspiracy.id}", status: :unprocessable_entity }
        end
      else
        vote = Vote.new(user: @user, conspiracy: @conspiracy)
        if vote.save
          respond_to do |format|
            format.turbo_stream { render turbo_stream: turbo_stream.replace("conspiracy-vote-#{@conspiracy.id}", partial: "shared/vote_btn", locals: { conspiracy: @conspiracy }) }
            format.html { render "conspiracy-vote-#{@conspiracy.id}", status: :unprocessable_entity }
          end
        end
      end
    end
  end
end
