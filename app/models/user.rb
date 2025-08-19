class User < ApplicationRecord
  has_many :conspiracies
  has_many :comments
  has_many :votes

  validates :user_name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
