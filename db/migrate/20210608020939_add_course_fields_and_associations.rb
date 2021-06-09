class AddCourseFieldsAndAssociations < ActiveRecord::Migration[5.1]
  def change

    change_table :courses do |t|
      t.string :course_name
      t.integer :holes, :par
    end

    change_table :course_details do |t|
      t.integer :hole_number, :hole_par
      t.references :course, foreign_key: true     
    end

    create_table :scores do |t|
      t.integer :hole_number, :hole_score
      t.references :course, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end

  end
end
