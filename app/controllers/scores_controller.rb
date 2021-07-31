require 'pry'

class ScoresController < ApplicationController
  def index
    @scores = Score.all
  end

  def new
    @courses = Course.all
  end

  def initialize_score_details
    @course = Course.find(params[:course_id])
    respond_to do |format|
      if @course
        (@course.holes).times { @course.scores.build }
        format.js
      else
        format.html { render 'new' }
      end
    end
  end

  private

  def score_params
    params.require(:score).permit([:hole_number, :hole_score])
  end
end
