class ConspiraciesController < ApplicationController
  def index
    @conspiracies = Conspiracy.all
  end

  def show
    @conspiracy = Conspiracy.find(params[:id])
  end

  def new
    @conspiracy = Conspiracy.new
    @chat = Chat.new
  end

  # def talk_with_ai
  #   RubyLLM.chat.ask("Generate an unhinged conspiracies with #{conspiracies.title} and #{conspiracies.content}.")
  # end

  # private

  # def conspiracy_params
  #   params.require(:conspiracy).permit(:title, :content)
  # end
end
