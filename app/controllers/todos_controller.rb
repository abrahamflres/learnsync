class TodosController < ApplicationController
  before_action :set_student
  def index
    @todos = @student.todos
  end

  def show
    @todo = @student.todos.find_by(params[:id])
  end

  def destroy
    @todo = @student.todos.find(params[:id])
    @todo.destroy
    redirect_to students_path
  end

  def new
    @todo = @student.todos.new
  end

  def create
    @todo = @student.build_todo(todo_params)

    if @todo.save
      redirect_to student_todos_path

    else
      render :new, status: :unprocessable_entity
    end
  end

private
  def set_student
    @student = current_user.student
  end

  def todo_params
    params.require(:todos).permit(:title, :description, :completed)
  end
end
