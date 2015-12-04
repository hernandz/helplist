class LecturesController < ApplicationController
  def index
    @lectures = Lecture.all
    @count = 0
  end


  private
    # Use callbacks to share common setup or constraints between actions.


    # Never trust parameters from the scary internet, only allow the white list through.
    def lecture_params
      params[:lecture]
    end
end
