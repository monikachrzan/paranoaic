class ChatsController < ApplicationController
  def show
    @chat = Chat.find(params[:id])
  end

  def create
    # topics = params[:conspiracy][:varone][]
    # user_input = topics.join(" and ")
    @conspiracy = Conspiracy.create(user: current_user)
    @chat = Chat.create(conspiracy: @conspiracy)

    topic_1 = params[:varone]
    topic_2 = params[:vartwo]
    user_input = "#{topic_1} and #{topic_2}"

    @message = Message.new(role: "user", content: user_input)
    @message.chat = @chat
    @ai_response = AiMessageService.new(@message).call

    redirect_to chat_path(@chat)
  end

end
