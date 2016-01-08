class Question < ActiveRecord::Base
  has_many :potential_replies
  has_many :choices, through: :potential_replies
  belongs_to :survey

  validates :body, presence: true
  validates :survey_id, presence: true, numericality: {only_integer: true}
end
