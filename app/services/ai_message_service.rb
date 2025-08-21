class AiMessageService
  def initialize(message)
    @message = message
  end

  def call
    instructions = @message.build_prompt
    @response = @message.chat.with_instructions(instructions).ask(@message.content)
    
    # response = RubyLLM.chat(model: "gemini-1.5-pro-latest").ask(prompt)
    # Message.create(role: "assistant", content: response.content, chat: @message.chat)
  end
end
