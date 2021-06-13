class CourseDetail < ApplicationRecord
  belongs_to :course

  def self.get_holes(course_name)
    CourseDetail.where(course_name: course_name).reorder('hole_number')
  end

end
