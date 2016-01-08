class Response < ActiveRecord::Base
  belongs_to :potential_reply
  belongs_to :user, through: :potential_reply, foreign_key: :responder_id
  belongs_to :survey
  belongs_to :question

  validates :potential_reply_id, presence: true, numericality: {only_integer: true}
  validates :responder_id, presence: true, numericality: {only_integer: true}
  validates :survey_id, presence: true, numericality: {only_integer: true}
  validates :question_id, presence: true, numericality: {only_integer: true}
end
