class CreateCourseDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :course_details do |t|

      t.timestamps
    end
  end
end
