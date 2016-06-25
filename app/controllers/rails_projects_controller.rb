class RailsProjectsController < ApplicationController

  before_action :require_user, except: [:index]

  # GET /rails_projects/new
  def new
    @rails_project = RailsProject.new
  end
  
  # GET /rails_projects/1/edit
  def edit
    @rails_project = RailsProject.find(params[:id])
    respond_to { |format| format.html }
  end
  
  def index
    @rails_projects = RailsProject.order('title ASC').paginate(page: params[:page], per_page: 4)
  end

  # POST /rails_projects
  # POST /rails_projects.json
  def create
    @rails_project = RailsProject.new(rails_project_params)

    respond_to do |format|
      if @rails_project.save
        format.html { redirect_to rails_projects_path, notice: 'Rails project was successfully created.' }
        format.json { render :show, status: :created, location: @rails_project }
      else
        format.html { render :new }
        format.json { render json: @rails_project.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    @rails_project = RailsProject.find(params[:id])
    
     if @rails_project.update_attributes(rails_project_params)
       # If update succeeds, redirect to the list action
       flash[:notice] = "Project updated."
       redirect_to :action => 'index', :id => @rails_project.id
     else
       # If update fails, redisplay the form so user can fix problems
       render :action => 'edit'
     end
  end
  

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def rails_project_params
      params.require(:rails_project).permit(:title, :description, :points, :github, :live_link, :image)
    end
end
