class Comment < ApplicationRecord
  belongs_to :conspiracy
  belongs_to :user

  validates :content, presence: true
end
