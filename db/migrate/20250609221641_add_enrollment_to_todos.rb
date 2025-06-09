class AddEnrollmentToTodos < ActiveRecord::Migration[8.0]
  def change
    add_reference :todos, :enrollment, null: true, foreign_key: true
  end
end
