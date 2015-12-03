class QuestionsController < ApplicationController
	def index 
		@questions = Question.all
	end	

	def new 
		@question = Question.new 
	end

	def create
		@question = Question.new
		@question.upvotes = 0;
		@question.datetime = DateTime.current;

	    if @question.update(question_params(params[:question]))
	      flash[:notice] = "Success! Go to questions"

	      redirect_to(:action => :new)
	    else
	      render(:action => :new)
	    end
	end

	def delete
	end

	def question_params(params)
    	params.permit(:question_text)
 	end
end
