class Course < ApplicationRecord
  # each row in course_details is a single hole
  has_many :course_details, dependent: :destroy
  has_many :scores, dependent: :destroy

  accepts_nested_attributes_for :course_details
  accepts_nested_attributes_for :scores
  
  validates :course_name, :presence => true, :uniqueness => true
  validates :holes, :presence => true
  validates :par, :presence => true

  def self.get_courses
    Course.distinct.pluck(:course_name)
  end

end
