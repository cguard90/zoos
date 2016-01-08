class Choice < ActiveRecord::Base
  has_many :potential_replies
  has_many :questions through: :potential_replies

  validates :value presence: true
end
