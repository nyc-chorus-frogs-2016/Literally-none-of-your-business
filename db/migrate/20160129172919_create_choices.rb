class CreateChoices < ActiveRecord::Migration
  def change
  	  	create_table :choices do |t|
  		t.integer :question_id, null: false
  		t.string :text, null: false
  		t.timestamps null: false
  	end
  end
end
