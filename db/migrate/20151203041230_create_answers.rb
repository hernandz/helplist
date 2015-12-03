class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      	t.timestamps
    	t.string :answer_text
    	t.integer :upvotes
    	t.datetime :datetime
    end
  end
end
