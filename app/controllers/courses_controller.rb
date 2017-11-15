class CoursesController < ApplicationController
    
  def show
    @course = Course.find params[:id]
    #redirect_to course_path
  end
   
  def index
    @courses = Course.all
  end
    
  def new
    #render new template
  end
    
  def create
    @course = Course.create!(params.require(:course).permit(:abbrev, :name, :crn))
    flash[:notice] = "#{@course.abbrev} was successfully created."
    redirect_to courses_path
  end
    
  def edit
    @course = Course.find params[:id]
  end
    
  def update
    @course = Course.find params[:id]
    @course.update_attributes!(params.require(:course).permit(:abbrev, :name, :crn))
    flash[:notice] = "#{@course.abbrev} was successfully updated."
    redirect_to course_path(@course)
  end

  def destroy
    @course = Course.find params[:id]
    @course.destroy
    flash[:notice] = "Course '#{@course.abbrev}' deleted."
    redirect_to courses_path
  end
    
end
