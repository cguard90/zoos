class CreatePotentialReplies < ActiveRecord::Migration
  def change
    create_table :potential_replies do |t|
      t.integer :choice_id null: false
      t.integer :question_id null: false
      t.timestamps null: false
    end
  end
end
