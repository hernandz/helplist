class Question < ActiveRecord::Base

	validates :text, :presence => { message: "cannot be blank."}
	belongs_to :user
	belongs_to :lecture
	has_many :answers
	def self.filter(substring, lecture_id)

		#if substring.nil?
		#	substring = ""
		#end
		questions = Array.new

		if lecture_id == "0"

			# Filter the users
			Question.all.each do |question|


				if(question.text.downcase.include?(substring.downcase))

					questions << question

				end

			end
		else
			Lecture.find(lecture_id).questions.each do |question|
				if(question.text.downcase.include?(substring.downcase))

					questions << question

				end
			end
		end

		return questions

	end
end
