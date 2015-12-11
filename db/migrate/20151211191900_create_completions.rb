class CreateCompletions < ActiveRecord::Migration
  def change
    create_table :completions do |t|
      t.integer :user_id
      t.integer :course_id
      t.integer :activity_id
      t.float :duration
      t.string :completion
      t.text :notes

      t.timestamps

    end
  end
end
