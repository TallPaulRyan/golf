class CourseDetailsController < ApplicationController
  
  before_action :authorize

  def index
    @course_details = Course_detail.all
  end

  def show
    @course_detail = Course_detail.find(params[:id])
  end

  def new
  end

  def create
  end  
end
