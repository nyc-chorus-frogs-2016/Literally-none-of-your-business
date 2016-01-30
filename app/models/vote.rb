class Vote < ActiveRecord::Base
  belongs_to :voter, foreign_key: :voter_id, class_name: "User"
  belongs_to :choice

  has_one :question, through: :choice

end
