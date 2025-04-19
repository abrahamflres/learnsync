class EnrollmentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @course = Course.find(params[:id])
    @enrollment = current_user.student.enrollments.build(course: @course)

    if @enrollment.save
      redirect_to enrollments_index_path, notice: "sucessfull"
    else
      redirect_to students_path, notice: "unsucessfull"
    end
  end
  def index
    @enrollments = current_user.student.enrollments
  end
end
