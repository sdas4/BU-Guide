class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :abbrev
      t.string :name
      #t.string :course_time
      t.string :crn

      t.timestamps null: false
    end
  end
end
