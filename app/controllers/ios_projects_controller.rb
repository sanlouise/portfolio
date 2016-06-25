class IosProjectsController < ApplicationController

  before_action :require_user, except: [:index]

  # GET /ios_projects/new
  def new
    @ios_project = IosProject.new
  end
  
  def index
    @ios_projects = IosProject.order('title ASC').paginate(page: params[:page], per_page: 4)
  end
  
  def edit
    @ios_project = IosProject.find(params[:id])
    respond_to { |format| format.html }
  end

  # POST /ios_projects
  # POST /ios_projects.json
  def create
    @ios_project = IosProject.new(ios_project_params)

    respond_to do |format|
      if @ios_project.save
        format.html { redirect_to ios_projects_path, notice: 'iOS project was successfully created.' }
        format.json { render :show, status: :created, location: @ios_project }
      else
        format.html { render :new }
        format.json { render json: ios_projects_path.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @ios_project = OtherProject.find(params[:id])
    
     if @ios_project.update_attributes(ios_project_params)
       # If update succeeds, redirect to the list action
       flash[:notice] = "Project updated."
       redirect_to :action => 'index', :id => @ios_project.id
     else
       # If update fails, redisplay the form so user can fix problems
       render :action => 'edit'
     end
  end


  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def ios_project_params
      params.require(:ios_project).permit(:title, :description, :points, :github, :live_link, :image)
    end
end
