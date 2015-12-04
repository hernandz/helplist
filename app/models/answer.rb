class Answer < ActiveRecord::Base

	validates :text, :presence => { message: "cannot be blank."}
	belongs_to :user
	belongs_to :question

end
