class Conspiracy < ApplicationRecord
  belongs_to :user
  has_many :votes
  has_many :comments


  # validates :title, presence: true
  # validates :content, presence: true
end
