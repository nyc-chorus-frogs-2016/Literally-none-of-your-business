class CreateTakenSurveys < ActiveRecord::Migration

  def change
    create_table :taken_surveys do |t|
      t.integer    :taker_id, null: false
      t.string     :survey_id, null: false

      t.timestamps null: false
    end
  end

end
