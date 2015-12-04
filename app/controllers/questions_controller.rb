class QuestionsController < ApplicationController
	def index 
		#TODO: add logic to be for the lecture
		@questions = Lecture.find(params[:id]).questions
		@questions = @questions.sort_by{|a| -a[:upvotes]}
		@subject_id = Lecture.find(params[:id]).subject_id
		session[:lecture_id]=params[:id]
	end	

	def change_lecture
		@subjects = Subject.all
	end
	def post_change_sort

	end
	def upvote
		question = Question.find(params[:id])
		question.upvotes = question.upvotes+1
		question.upvoted = true
		question.save
		Question.order(upvotes: :desc)
		redirect_to(:back)
	end
	def downvote
		question = Question.find(params[:id])
		question.upvotes = question.upvotes-1
		question.upvoted = false

		question.save
		redirect_to(:back)
	end
	def log_in
		if session[:user_id]
			redirect_to(:action => :new, :id => 1)
		end

	end
	def post_log_in
		session[:user_id] = params[:text]
		session[:created_questions] = Array.new
		session[:upvoted] = Array.new
		redirect_to(:action => :new, :id => 1)
	end

	def sort_by_newest

		Question.order(datetime: :desc)
		redirect_to(:action => :new, :id => params[:id])

	end

	def display
		@question = Question.find(params[:id])
		if @question.answers
			@answers = @question.answers
			@answers = @answers.sort_by{|a| -a[:upvotes]}
		end
	end

  	def html_filter
    @questions = Question.filter(params[:substring],params[:lecture_id])
    render :partial => "html_filter"
 	end

	def new 
		@question = Question.new 
		if params[:id]
			@subject = Subject.find(params[:id])
		end
		session[:subject_id]=@subject.id

	end

	def create
		@question = Question.new
		@question.upvotes = 0;
		@question.datetime = DateTime.current;
	    if @question.update(question_params(params[:question]))
	      flash[:notice] = "Success! Go to questions"
	      session[:created_questions].push(@question.id)

	      redirect_to(:action => :new)
	    else
		  @subject = Subject.find(session[:subject_id])

	      render(:action => :new)
	    end
	end

	def delete
	end

	def question_params(params)
    	params.permit(:text)
 	end
end
