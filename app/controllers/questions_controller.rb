class QuestionsController < ApplicationController
	def index 
		#TODO: add logic to be for the lecture
		@questions = Lecture.find(params[:id]).questions
		@questions = @questions.sort_by{|a| -a[:upvotes]}
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
			redirect_to(:action => :new, :id => 1, :lecture_id => 1)
		end

	end
	def post_log_in
		session[:user_id] = params[:text]
		session[:created_questions] = Array.new
		session[:upvoted] = Array.new
		session[:subject_id] = 1
		redirect_to(:action => :new, :id => 1, :lecture_id =>1)
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
		@subject = Subject.find(params[:id])
		session[:subject_id] = @subject.id

	end

	def create
		@question = Question.new
		@question.upvotes = 0;
		@question.datetime = DateTime.current;
	    if @question.update(question_params(params[:question]))
	      flash[:notice] = "Success! Go to questions"
	      @question.save
	      redirect_to(:action => :new, :id => session[:subject_id], :lecture_id => params[:question][:lecture_id])
	    else
		  @subject = Subject.find(session[:subject_id])

	      render(:action => :new)
	    end
	end

	def delete
		@question  = Question.find(params[:id])
	    lecture_id = @question.lecture_id
	    @question.destroy
	    redirect_to(:controller=> :questions, :action => :index, :id => lecture_id)
	end
	def edit_options
    	@question = Question.find(params[:id])
 	end

	def question_params(params)
    	params.permit(:text,:subject_id,:upvotes,:lecture_id,:datetime)
 	end
end
