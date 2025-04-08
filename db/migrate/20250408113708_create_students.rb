class CreateStudents < ActiveRecord::Migration[8.0]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :year_standing
      t.string :major
      t.string :minor
      t.string :degree

      t.timestamps
    end
  end
end
