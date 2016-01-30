class TakenSurvey < ActiveRecord::Base
  belongs_to :taker, foreign_key: :taker_id, class_name: "User"
  belongs_to :survey
end
