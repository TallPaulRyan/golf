class CourseDetailsController < ApplicationController
  
  before_action :authorize

  def index
    # This is wrong here I beleive, correct for show
    @course = Course.find(params[:course_id])
    @course_details = @course.course_details.all
  end

  def show
    @course = Course.find(params[:course_id])
    @course_details = @course.course_detail.all
  end

  def new
  end

  def create
  end  
end
