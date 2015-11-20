class Question < ActiveRecord::Base

	validates :question_text, :presence => { message: "cannot be blank."}
	belongs_to :user
	belongs_to :lecture
	has_many :answers

end
