class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :potential_reply_id, null: false
      t.integer :answerer_id, null: false
      t.integer :survey_id, null: false
      t.integer :question_id, null: false

      t.timestamps null: false
    end
  end
end
