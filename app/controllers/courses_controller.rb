class CoursesController < ApplicationController
  before_action :authenticate_user!
  def show
    @course= Course.find(params[:id])
  end
  def index
    @courses = Course.all
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "coursename", "description", "subjectcode", "created_at", "updated_at", "id" ]
  end
end
