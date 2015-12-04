class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  # GET /answers
  # GET /answers.json
  def index
    @answers = Answer.all
  end
  def upvote
    answer = Answer.find(params[:id])
    answer.upvotes = answer.upvotes+1
    answer.upvoted = true
    answer.save
    redirect_to(:back)
  end
  def downvote
    answer = Answer.find(params[:id])
    answer.upvotes = answer.upvotes-1
    answer.upvoted = false

    answer.save
    redirect_to(:back)
  end
  def controls
  end
  # GET /answers/1
  # GET /answers/1.json
  def show
  end

  # GET /answers/new
  def new
    @answer = Answer.new
    @answers = Question.find(params[:id]).answers
    @question = Question.find(params[:id])
  end

  # GET /answers/1/edit
  def edit
    @answer = Answer.find(params[:id])
  end

  # POST /answers
  # POST /answers.json
  def create
    @question = Question.find(params[:answer][:question_id])
    @answer = Answer.new
    @answer.upvotes = 0;

    if @answer.update(answer_params(params[:answer])) 

      redirect_to(:controller=> :questions, :action => :display, :id => @question.id)
      else

        render(:action => :new, :id => @question.id)
      end
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to @answer, notice: 'Answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @answer }
      else
        format.html { render :edit }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to answers_url, notice: 'Answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params(params)
      params.permit(:text,:question_id)
    end
end
