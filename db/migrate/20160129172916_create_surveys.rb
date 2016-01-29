class CreateSurveys < ActiveRecord::Migration
	def change
		create_table :surveys do |t|
			t.integer :creator_id, null: false
			t.string :title, null: false
			t.string :description
			t.timestamps null: false
		end
	end
end
