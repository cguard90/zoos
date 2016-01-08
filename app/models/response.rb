class Response < ActiveRecord::Base
  belongs_to :potential_reply
  belongs_to :user, foreign_key: :responder_id
  belongs_to :survey
  belongs_to :question
  has_one :choice, through: :potential_reply

  validates :potential_reply_id, presence: true, numericality: {only_integer: true}
  validates :responder_id, presence: true, numericality: {only_integer: true}
  validates :survey_id, presence: true, numericality: {only_integer: true}
  validates :question_id, presence: true, numericality: {only_integer: true}
end
