class StudentsController < ApplicationController
  before_action :authenticate_user!
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

  def show
    @student = Student.find(params[:id])
  end


  def create
    @student = current_user.build_student(student_params)

    if @student.save
      redirect_to students_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  def edit
    @student = Student.find_by(params[:id])
  end

  def update
    @student = Student.find_by(params[:id])


    if @student.update(student_params)
      redirect_to students_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @student = Student.find(params[:id])
  end


private
  def student_params
    params.require(:student).permit(:firstname, :lastname, :yearstanding, :major, :minor, :degree)
  end
end
