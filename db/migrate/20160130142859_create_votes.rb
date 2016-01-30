class CreateVotes < ActiveRecord::Migration

  def change
    create_table :votes do |t|
      t.integer    :voter_id, null: false
      t.string     :choice_id, null: false

      t.timestamps null: false
    end
  end

end
