class User < ActiveRecord::Base
  has_many :surveys
  has_many :questions through: :surveys
  has_many :responses

  validates :email presence: true, uniqueness: true
  validates :password_hash presence: true
end
