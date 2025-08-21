class ChatsController < ApplicationController
  def show
    @chat = Chat.find(params[:id])
    @message = Message.new
  end

  def create
    # topics = params[:conspiracy][:varone][]
    # user_input = topics.join(" and ")
    @conspiracy = Conspiracy.create(user: current_user)
    @chat = Chat.create(conspiracy: @conspiracy, model_id: "gemini-1.5-pro-latest")

    topic_one = params[:varone]
    topic_two = params[:vartwo]
    user_input = "#{topic_one} and #{topic_two}"

    @message = Message.new(role: "user", content: user_input)
    @message.chat = @chat
    @ai_response = AiMessageService.new(@message).call

    redirect_to chat_path(@chat)
  end
end
