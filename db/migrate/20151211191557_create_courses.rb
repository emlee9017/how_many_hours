class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :course_num
      t.string :course_name
      t.string :professor

      t.timestamps

    end
  end
end
