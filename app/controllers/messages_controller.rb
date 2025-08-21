class MessagesController < ApplicationController
  def create
    @conspiracy = Conspiracy.find(params[:conspiracy_id])
    @message = Message.new(message_params)
    @message.role = "user"
    @message.conspiracy = @conspiracy
    if @message.save
      AiMessageService.new(@message).call
      redirect_to conspiracy_path(@conspiracy)
    else
      render "conspiracies/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
