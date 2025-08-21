class Chat < ApplicationRecord
  acts_as_chat
  # attribute :model_id, :string, default: "gemini-1.5-pro-latest"

  belongs_to :conspiracy
  has_many :messages
end
