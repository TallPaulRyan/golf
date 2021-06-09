require 'pry'

class CoursesController < ApplicationController

  before_action :authorize

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new
  end

  def initialize_course_details
    # We'd like to handle the ajax subission here.
    # Once the course is selected, we will generate course detail objects
    #   to populate the dynamically generated form
    @course = Course.new(course_params)

    respond_to do |format|
      if @course
        (@course.holes).times { @course.course_details.build }
        format.js
      else
        format.html { render 'new'}
      end
    end
  end

  def create
    @course = Course.new(course_details_params)

    if @course.save!
      redirect_to root_path
    else
      redirect_to new_course_path
    end
  end


  private

    def course_params
      params.require(:course).permit(:course_name, :holes, :par)
    end

    def course_details_params
      params.require(:course).permit(:course_name, :holes, :par, course_details_attributes: [:hole_number, :hole_par])
    end
end
