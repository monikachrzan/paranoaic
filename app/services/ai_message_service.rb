class AiMessageService
  def initialize(message)
    @message = message
  end

  def call
    instructions = @message.build_prompt
    @response = @message.chat.with_instructions(instructions).ask(@message.content)
  end
end
