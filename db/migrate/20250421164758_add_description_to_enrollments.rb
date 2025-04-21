class AddDescriptionToEnrollments < ActiveRecord::Migration[8.0]
  def change
    add_column :enrollments, :description, :text
  end
end
