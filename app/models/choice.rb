class Choice < ActiveRecord::Base
  # Remember to create a migration!
  has_many :potential_replies
  has_many :questions through: :potential_replies


end
