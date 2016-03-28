class RailsProjectsController < ApplicationController
  before_action :set_rails_project, only: [:show, :edit, :update, :destroy]

  # GET /rails_projects
  # GET /rails_projects.json
  def index
    @rails_projects = RailsProject.all
  end

  # GET /rails_projects/1
  # GET /rails_projects/1.json
  def show
  end

  # GET /rails_projects/new
  def new
    @rails_project = RailsProject.new
  end

  # GET /rails_projects/1/edit
  def edit
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

  # PATCH/PUT /rails_projects/1
  # PATCH/PUT /rails_projects/1.json
  def update
    respond_to do |format|
      if @rails_project.update(rails_project_params)
        format.html { redirect_to @rails_project, notice: 'Rails project was successfully updated.' }
        format.json { render :show, status: :ok, location: @rails_project }
      else
        format.html { render :edit }
        format.json { render json: @rails_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rails_projects/1
  # DELETE /rails_projects/1.json
  def destroy
    @rails_project.destroy
    respond_to do |format|
      format.html { redirect_to rails_projects_url, notice: 'Rails project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rails_project
      @rails_project = RailsProject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rails_project_params
      params.require(:rails_project).permit(:title, :description, :points, :github, :live_link, :image)
    end
end
