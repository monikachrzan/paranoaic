class Chat < ApplicationRecord
  act_as_chat
  
  belongs_to :conspiracy
  has_many :messages
end
