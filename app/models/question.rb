class Question < ActiveRecord::Base

	belongs_to :user
	belongs_to :lecture
	has_many :answers

end
