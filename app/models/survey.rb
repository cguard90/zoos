class Survey < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user foreign_key: :creator_id
  has_many :questions
  has_many :responses through: :questions

end
