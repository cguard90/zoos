class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :surveys
  has_many :questions through: :surveys
  has_many :responses

end
