class CoursesController < ApplicationController
  def index
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    @course.user = current_user
    if @course.save
      flash[:success] = "Course has been added."
      redirect_to rides_path
    else
      render :action => :new
    end
  end

  private

  def course_params
    params.require(:course).permit(:name, :location, :airport, :date)
  end
end
