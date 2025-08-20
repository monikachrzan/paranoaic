class AiMessageService
  def initialize(message)
    @message = message
  end

  def call
    prompt = @message.build_prompt
    response = RubyLLM.chat_gemini.ask(prompt)
    Message.create(role: "assistant", content: response.content, conspiracy: @message.conspiracy)
  end
end
