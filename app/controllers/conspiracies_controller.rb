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

  def create
    chat_id = params[:chat_id] || params.dig(:conspiracy, :chat_id)
    chat = Chat.find(chat_id)
    ai_message = chat.messages.where(role: "assistant").order(created_at: :desc).first

    unless ai_message
      redirect_to chat_path(chat), alert: "There is no AI response to save yet"
      return
    end

    title, content = extract_title_and_content(ai_message.content)

    @conspiracy = Conspiracy.new(user: current_user, title: title, content: content)
    if @conspiracy.save
      redirect_to conspiracy_path(@conspiracy), notice: "Conspiracy created!"
    else
      redirect_to chat_path(chat), alert: @conspiracy.errors.full_messages.to_sentence
    end
  end

  def update
    @conspiracy = Conspiracy.find(params[:id])
    chat_id = params[:chat_id] || params.dig(:conspiracy, :chat_id)
    chat = Chat.find(chat_id)
    ai_message = chat.messages.where(role: "assistant").order(created_at: :desc).first

    if @conspiracy.content.nil?
      @conspiracy.content = ai_message.content
      @conspiracy.save
      @message = Message.new(content: "Can you generate a title?", role: "user", chat: chat)
      AiMessageService.new(@message).call
      redirect_to chat_path(chat) # turbo
    else
      @conspiracy.title = ai_message.content
      @conspiracy.save
      redirect_to conspiracy_path(@conspiracy)
    end
  end
  private

  # def extract_title_and_content(text)
  #   body = text.to_s.strip

  #   lines = body.lines
  #   first = lines.first.to_s.strip

  #   if first.start_with?("#")
  #     title = first.sub(/\A#+\s*/, "").strip
  #     rest = lines[1..]&.join.to_s.strip
  #     return [title.presence || "Untitled Conspiracy", rest.presence || body]
  #   end

  #   parts = body.split(/\n{2,}/)
  #   if parts.length >= 2
  #     title = first [0, 120]
  #     content = parts[1..].join("\n\n").strip
  #     return [title.presence || "Untitled Conspiracy", content.presence || body]
  #   end

  #   title = first[0, 120]
  #   content = body.sub(first, "").strip
  #   [title.presence || "Untitled Conspiracy", content.presence || body]
  # end
end
