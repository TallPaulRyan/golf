class CourseDetail < ApplicationRecord
  belongs_to :course

  def self.get_holes(course_id)
    CourseDetail.where(course_id: course_id).reorder('hole_number')
  end

end
