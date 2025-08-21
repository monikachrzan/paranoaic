class Chat < ApplicationRecord
  acts_as_chat

  belongs_to :conspiracy
  has_many :messages
end
