class User < ActiveRecord::Base
  has_many :surveys, foreign_key: :creator_id
  has_many :responses, foreign_key: :responder_id
  has_many :questions, through: :surveys

  validates :email, presence: true, uniqueness: true
  validates :password_hash, presence: true
end
