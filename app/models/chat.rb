class Chat < ApplicationRecord
  belongs_to :conspiracy
  has_many :messages
end
