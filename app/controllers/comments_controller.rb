class CommentsController < ApplicationController
  def new
    @conspiracy = Conspiracy.find(params[:conspiracy_id])
    @comment = Comment.new
  end

  def create
    if user_signed_in?
      @conspiracy = Conspiracy.find(params[:conspiracy_id])
      @comment = Comment.new(comment_params)
      @comment.conspiracy = @conspiracy
      @comment.user = current_user
      if @comment.save
        redirect_to conspiracy_path(@conspiracy)
      else
        respond_to do |format|
          format.turbo_stream { render turbo_stream: turbo_stream.replace("Comment_form", partial: "shared/comment_form", locals: {comment: @comment, conspiracy: @conspiracy})}
          format.html { render "shared/comment_form", status: :unprocessable_entity }
        end
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
