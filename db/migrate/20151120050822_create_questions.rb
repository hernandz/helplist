class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
    	t.timestamps
    	t.string :text
    	t.integer :upvotes
    	t.datetime :datetime
    	t.integer :user_id
    	t.integer :lecture_id
        t.boolean :upvoted
    end
  end
end
