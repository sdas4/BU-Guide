class ProfessorsController < ApplicationController

    def show
        @professor = Professor.find params[:id]
        #redirect_to professor_path
    end
    
    def index
        @professors = Professor.all
    end
    
    def new
        #render new template
    end
    
    def create
        vals = params[:professor]
        # if(Professor.exists?(:name => vals[:name]))
        #   flash[:warning] = "#{vals[:name]} already exists! Please try a new one."
        # else
        @professor = Professor.create(params.require(:professor).permit(:name, :office, :classes))
        if @professor.errors.any?
            #flash[:warning] = "Invalid Professor Entry."
            #flash[:warning] = "#{vals[:name]} already exists! Please try a new one."
            flash[:warning] = @professor.errors.full_messages.first
            #redirect_to :back
            redirect_to professors_path
        else
            flash[:notice] = "#{@professor.name} was successfully created."
            redirect_to professors_path
        end
        #     if !@professor.valid?
        #         flash[:warning] = "Invalid Professor Entry."
        #     else
        #         flash[:notice] = "#{@professor.name} was successfully created."
        #     end
        # end
        #redirect_to professors_path
    end
    
    def edit
        @professor = Professor.find params[:id]
        #redirect_to edit_professor_path
    end
    
  def update
    vals = params[:professor]
    @professor = Professor.find params[:id]
    @professor.update_attributes(params.require(:professor).permit(:name, :office, :classes))
    if @professor.errors.any?
        flash[:warning] = @professor.errors.full_messages.first
        redirect_to :back
    else
        flash[:notice] = "#{@professor.name} was successfully updated." 
        redirect_to professor_path(@professor)
    end
        
    # if(Professor.exists?(:name => vals[:name]) and @professor.name != vals[:name])
    #   flash[:warning] = "#{vals[:name]} already exists! Please try a new one."
    # else#(Course.exists?(:abbrev => vals[:classes]))
    #     @professor.update_attributes!(params.require(:professor).permit(:name, :office, :classes))
    #     flash[:notice] = "#{@professor.name} was successfully updated." 
    # #else
    #   #@professor.update_attributes!(params.require(:professor).permit(:name, :office, :classes))
    #     #flash[:notice] = "#{@professor.classes} is not a listed course." 
    # end
    # redirect_to professor_path(@professor)
  end

  def destroy
    @professor = Professor.find(params[:id])
    @professor.destroy
    flash[:notice] = "Professor '#{@professor.name}' deleted."
    redirect_to professors_path
  end
    
end
