class EnrollmentsController < ApplicationController
  before_action :authenticate_user!
  def edit
    @enrollment = current_user.student.enrollments.find(params[:id])
  end

  def update
    @enrollment = current_user.student.enrollments.find(params[:id])
    if @enrollment.update(enrollment_params)
      redirect_to enrollments_path, notice: "Note updated"
    else
      render :edit, alert: "Update error"
    end
  end

  def destroy
    @enrollment = current_user.student.enrollments.find(params[:id])
    @enrollment.destroy
    redirect_to enrollments_path, notice: "Unenrolled Suucess"
  end

  def create
    @course = Course.find(params[:id])
    @enrollment = current_user.student.enrollments.build(course: @course)

    if @enrollment.save
      redirect_to students_path, notice: "Enrolled successfully!"
    else

      redirect_to root_path, notice: "Enrollment failed"
    end
  end
  def index
    @enrollments = current_user.student.enrollments
  end

  private

  def enrollment_params
    params.require(:enrollment).permit(:note)
  end
end
