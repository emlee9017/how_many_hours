class RemoveCourseIdFromCompletions < ActiveRecord::Migration
  def change
    remove_column :completions, :course_id, :integer
  end
end
