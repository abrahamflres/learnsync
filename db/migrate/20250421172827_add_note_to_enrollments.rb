class AddNoteToEnrollments < ActiveRecord::Migration[8.0]
  def change
    add_column :enrollments, :note, :text
  end
end
