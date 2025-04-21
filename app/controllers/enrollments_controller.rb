class EnrollmentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @course = Course.find(params[:course_id])
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
end
