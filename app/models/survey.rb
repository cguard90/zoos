class Survey < ActiveRecord::Base
  belongs_to :user, foreign_key: :creator_id
  has_many :questions
  has_many :answers, through: :questions

  validates :creator_id, presence: true, numericality: {only_integer: true}
  validates :title, presence: true
  validates :description, presence: true
end
