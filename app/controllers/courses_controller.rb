class CoursesController < ApplicationController
    
  def show
    @course = Course.find params[:id]
    #redirect_to courses_path
  end
   
  def index
    @courses = Course.all
  end
    
  def new
    #render new template
  end
    
  def create
    vals = params[:course]
    # if(Course.exists?(:abbrev => vals[:abbrev]))
    #   flash[:warning] = "#{vals[:abbrev]} already exists! Please try a new one."
    # else
    @course = Course.create(params.require(:course).permit(:abbrev, :name, :crn, :teacher))
    if @course.errors.any?
        flash[:warning] = @course.errors.full_messages.first
        redirect_to :back
    else
        redirect_to courses_path
    end
      #end
    #     if !@course.valid?
    #         flash[:warning] = "Invalid Course Entry."
    #     end
    # end
    # @course = Course.create!(params.require(:course).permit(:abbrev, :name, :crn, :teacher))
    # flash[:notice] = "#{@course.abbrev} was successfully created."
    #redirect_to courses_path
  end
    
  def edit
    @course = Course.find params[:id]
  end
    
  def update
    vals = params[:course]
    @course = Course.find params[:id]
    @course.update_attributes(params.require(:course).permit(:abbrev, :name, :crn, :teacher))
   # @err = @course.errors
    if @course.errors.any?
        flash[:warning] = @course.errors.full_messages.first
        redirect_to :back
    else
        flash[:notice] = "#{@course.abbrev} was successfully updated"
        redirect_to courses_path
    end
    # if(Course.exists?(:abbrev => vals[:abbrev]) and @course.abbrev != vals[:abbrev])
    #   flash[:warning] = "#{vals[:abbrev]} already exists! Please try a new one."
    # else
    #   @course.update_attributes!(params.require(:course).permit(:abbrev, :name, :crn, :teacher))
    #   flash[:notice] = "#{@course.abbrev} was successfully updated." 
    # end
    #redirect_to course_path(@course)
  end

  def destroy
    @course = Course.find params[:id]
    @course.destroy
    flash[:notice] = "Course '#{@course.abbrev}' deleted."
    redirect_to courses_path
  end
  
end