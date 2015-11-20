class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
    	t.timestamps
    	t.string :question_text
    	t.integer :upvotes
    	t.datetime :datetime
    end
  end
end
