class RailsProjectsController < ApplicationController

  # GET /rails_projects/new
  def new
    @rails_project = RailsProject.new
  end


  # POST /rails_projects
  # POST /rails_projects.json
  def create
    @rails_project = RailsProject.new(rails_project_params)

    respond_to do |format|
      if @rails_project.save
        format.html { redirect_to @rails_project, notice: 'Rails project was successfully created.' }
        format.json { render :show, status: :created, location: @rails_project }
      else
        format.html { render :new }
        format.json { render json: @rails_project.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def rails_project_params
      params.require(:rails_project).permit(:title, :description, :points, :github, :live_link, :image)
    end
end
