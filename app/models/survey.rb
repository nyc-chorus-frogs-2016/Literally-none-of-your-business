class Survey < ActiveRecord::Base
  belongs_to :creator, foreign_key: :creator_id, class_name: "User"

  has_many :questions
  has_many :choices, through: :questions

end
