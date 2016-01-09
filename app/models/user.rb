class User < ActiveRecord::Base
  include BCrypt

  has_many :surveys, foreign_key: :creator_id
  has_many :answers, foreign_key: :answer_id
  has_many :questions, through: :surveys

  validates :email, presence: true, uniqueness: true
  validates :password_hash, presence: true, length: {minimum: 3}

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
