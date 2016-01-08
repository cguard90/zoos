class PotentialReply < ActiveRecord::Base
  belongs_to :choice
  belongs_to :question
  has_many :responses

  validates :choice_id, presence: true, numericality: {only_integer: true}
  validates :question_id, presence: true, numericality: {only_integer: true}
end
