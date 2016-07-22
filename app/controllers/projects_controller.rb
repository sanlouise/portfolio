class ProjectsController < ApplicationController

  def index
    @projects = Project.order('title ASC').paginate(page: params[:page], per_page: 4)
  end
  
end
