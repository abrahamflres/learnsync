class StudentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_student, only: [ :show, :edit, :update, :destroy ]
  def index
    @courses = Course.all
  end
  def new
    if current_user.student.present?
      redirect_to edit_student_path(current_user)
    else

      @student = current_user.build_student
    end
  end

  def show; end


  def create
    @student = current_user.build_student(student_params)

    if @student.save
      redirect_to students_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  def edit; end


  def update
    if @student.update(student_params)
      redirect_to students_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy; end


private
  def student_params
    params.require(:student).permit(:firstname, :lastname, :yearstanding, :major, :minor, :degree)
  end

  def set_student
    @student = Student.find(params[:id])
  end
end
