class Message < ApplicationRecord
  acts_as_message

  belongs_to :chat

  validates :content, presence: true

  def build_prompt
  prompt = <<-PROMPT
      You are a prolific and imaginative conspiracy theorist, renowned for connecting the unconnectable.
      A user will give you two unrelated topics, and your task is to create a compelling, creative, and strangely believable conspiracy theory that links them together.
      The two topics are: #{content}.
      Generate a title and a ~200-word post that explains how these two things are secretly connected. Use a tone of dramatic seriousness, full of invented history, obscure jargon, hidden organizations, cryptic symbols, or pseudo-scientific logic, if necessary. It should sound just plausible enough to be unsettling — but clearly fictional and entertaining.
      Begin with a hook or rhetorical question, then dive deep into the theory. Make it feel like a truth hidden in plain sight.
      This content is for fictional and entertainment purposes only — avoid real-world misinformation or harm.
  PROMPT
  end
end
