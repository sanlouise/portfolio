class OtherProjectsController < ApplicationController
  
  before_action :require_user, except: [:index]

  # GET /other_projects
  # GET /other_projects.json
  def index
    @other_projects = OtherProject.order('title ASC').paginate(page: params[:page], per_page: 4)
  end

  # GET /other_projects/new
  def new
    @other_project = OtherProject.new
  end

  # GET /other_projects/1/edit
  def edit
    @other_project = OtherProject.find(params[:id])
    respond_to { |format| format.html }
  end

  # POST /other_projects
  # POST /other_projects.json
  def create
    @other_project = OtherProject.new(other_project_params)

    respond_to do |format|
      if @other_project.save
        format.html { redirect_to other_projects_path, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @other_project }
      else
        format.html { render :new }
        format.json { render json: @other_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /other_projects/1
  # PATCH/PUT /other_projects/1.json
  def update
    @other_project = OtherProject.find(params[:id])
    
     if @other_project.update_attributes(other_project_params)
       # If update succeeds, redirect to the list action
       flash[:notice] = "Project updated."
       redirect_to :action => 'index', :id => @other_project.id
     else
       # If update fails, redisplay the form so user can fix problems
       render :action => 'edit'
     end
  end

  # DELETE /other_projects/1
  # DELETE /other_projects/1.json
  def destroy
    @other_project.destroy
    respond_to do |format|
      format.html { redirect_to other_projects_url, notice: 'Other project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_other_project
      @other_project = OtherProject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def other_project_params
      params.require(:other_project).permit(:title, :description, :points, :github, :live_link, :image)
    end
end
