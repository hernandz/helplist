class CreateLectures < ActiveRecord::Migration
  def change
    create_table :lectures do |t|

      	t.timestamps
    	t.datetime :datetime    
    	t.integer :subject_id

    end
  end	
end
