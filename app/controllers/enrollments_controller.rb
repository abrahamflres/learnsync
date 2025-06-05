class EnrollmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_student
  def edit
    @enrollment = @student.enrollments.find(params[:id])
  end

  def update
    @enrollment = @student.enrollments.find(params[:id])
    if @enrollment.update(enrollment_params)
      redirect_to student_enrollments_path, notice: "Note updated"
    else
      render :edit, alert: "Update error"
    end
  end

  def destroy
    @enrollment = @student.enrollments.find(params[:id])
    @enrollment.destroy
    redirect_to students_path, notice: "Unenrolled Suucess"
  end

  def create
    @course = Course.find(params[:course_id])

    @enrollment = @student.enrollments.build(course: @course)

    if @enrollment.save
      redirect_to student_enrollments_path, notice: "Enrolled successfully!"
    else

      redirect_to root_path, notice: "Enrollment failed"
    end
  end
  def index
    @enrollments = @student.enrollments
  end

  def show
    @enrollment = @student.enrollments.find(params[:id])
  end

  private

  def enrollment_params
    params.require(:enrollment).permit(:note, :image)
  end
  def set_student
    @student = current_user.student
  end
end
