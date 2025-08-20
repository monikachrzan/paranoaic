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
    # topics = params[:conspiracy][:varone][]
    # user_input = topics.join(" and ")
    topic_1 = params[:varone]
    topic_2 = params[:vartwo]
    user_input = "#{topic_1} and #{topic_2}"
    @conspiracy = Conspiracy.new()
    @message = Message.new(role: "user", content: user_input)
    @message.conspiracy = @conspiracy
    @ai_response = AiMessageService.new(@message).call
    @user = current_user
    @conspiracy.user = @user
    if @conspiracy.save
      redirect_to conspiracy_path(@conspiracy)
    else
      render "new", status: :unprocessable_entity
    end
  end
  # def talk_with_ai
  #   RubyLLM.chat.ask("Generate an unhinged conspiracies with #{conspiracies.title} and #{conspiracies.content}.")
  # end

  private

  # def conspiracy_params
  #   params.require(:conspiracy).permit(:title, :content)
  # end
end
