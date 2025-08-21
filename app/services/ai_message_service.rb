class AiMessageService
  def initialize(message)
    @message = message
  end

  def call
    if @message.chat.conspiracy.content.nil?
    instructions = @message.build_content
    else
    instructions = @message.build_title 
    end
    @response = @message.chat.with_instructions(instructions).ask(@message.content)
  end
end
