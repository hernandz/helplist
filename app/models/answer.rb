class Answer < ActiveRecord::Base

	validates :answer_text, :presence => { message: "cannot be blank."}
	belongs_to :user
	belongs_to :question

end
