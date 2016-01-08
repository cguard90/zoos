class Question < ActiveRecord::Base
  # Remember to create a migration!
    has_many :potential_replies
    has_many :choices through: :potential_replies
    belongs_to :survey
end
