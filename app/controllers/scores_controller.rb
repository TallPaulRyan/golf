require 'pry'

class ScoresController < ApplicationController
  def index
    @scores = Score.all
  end

  def new
    @courses = Course.get_courses
  end

  def initialize_score_details
    binding.pry
    @course = Course.find_by course_name: params[:course_name]
    @course_holes = CourseDetail.get_holes(params[:course_name])
    respond_to do |format|
      if @course
        format.js
      else
        format.html { render 'new' }
      end
    end
  end

  def create
    @score = Score.new(params)
    if @score.save!
      redirect_to scores_path
    else
      redirect_to new_score_path
    end
  end

  private

  def course_params
    params.require(:course).permit(:course_name, :holes, :par)
  end
end
