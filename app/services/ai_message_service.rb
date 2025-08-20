class AiMessageService
  def initialize(message)
    @message = message
  end

  def call
    prompt = @message.build_prompt
    response = RubyLLM.chat(model: "gemini-1.5-pro-latest").ask(prompt)
    Message.create(role: "assistant", content: response.content, chat: @message.chat)
  end
end
