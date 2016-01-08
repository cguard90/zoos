class Response < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :potential_reply
  belongs_to :user through: :potential_reply, foreign_key: :responder_id
  belongs_to :survey
  belongs_to :question

end
