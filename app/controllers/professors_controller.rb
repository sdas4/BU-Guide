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
        @professor = Professor.create!(params.require(:professor).permit(:name, :office))
        flash[:notice] = "#{@professor.name} was successfully created."

        redirect_to professors_path
    end
    
    def edit
        @professor = Professor.find params[:id]
        #redirect_to edit_professor_path
    end
    
  def update
    @professor = Professor.find params[:id]
    @professor.update_attributes!(params.require(:professor).permit(:name, :office))
    flash[:notice] = "#{@professor.name} was successfully updated."
    redirect_to professor_path(@professor)
  end

  def destroy
    @professor = Professor.find(params[:id])
    @professor.destroy
    flash[:notice] = "Professor '#{@professor.name}' deleted."
    redirect_to professors_path
  end
    
end
