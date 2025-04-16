class CreateStudents < ActiveRecord::Migration[8.0]
  def change
    create_table :students do |t|
      t.string :firstname
      t.string :lastname
      t.string :yearstanding
      t.string :major
      t.string :minor
      t.string :degree
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
