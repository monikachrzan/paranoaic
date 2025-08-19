class Message < ApplicationRecord
  belongs_to :conspiracy

  validates :content, presence: true
end
