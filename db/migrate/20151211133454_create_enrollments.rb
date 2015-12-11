class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.integer :user_id
      t.integer :course_id
      t.integer :course_num
      t.string :course_name
      t.integer :year
      t.string :quarter

      t.timestamps

    end
  end
end
