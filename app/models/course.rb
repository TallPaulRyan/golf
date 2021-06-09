class Course < ApplicationRecord
  # each row in course_details is a single hole
  has_many :course_details, dependent: :destroy
  has_many :scores

  accepts_nested_attributes_for :course_details
  
  validates :course_name, :presence => true, :uniqueness => true
  validates :holes, :presence => true
  validates :par, :presence => true
end
