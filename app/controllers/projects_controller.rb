class ProjectsController < ApplicationController

  include ProjectsHelper

  def index
    if params[:project_type]
      filter_projects(project_params)
    else
      @projects = Project.where.not("project_type LIKE ?", "%iOS%").reverse
    end
  end

  private

    def project_params
      params.require(:project_type)
    end
  
end
