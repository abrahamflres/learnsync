class CreateCourses < ActiveRecord::Migration[8.0]
  def change
    create_table :courses do |t|
      t.string :coursename
      t.string :subjectcode

      t.timestamps
    end
  end
end
