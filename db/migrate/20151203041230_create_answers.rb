class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      	t.timestamps
    	t.string :text
    	t.integer :upvotes
    	t.datetime :datetime
    	t.integer :question_id
    	t.integer :user_id
      t.boolean :upvoted

    end
  end
end
