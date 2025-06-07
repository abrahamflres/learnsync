class TodosController < ApplicationController
  before_action :set_student
  def index
    @todos = @student.todos
    @student
  end

  def show
    @todo = @student.todo
  end



private
  def set_student
    @student = current_user.student
  end
end
