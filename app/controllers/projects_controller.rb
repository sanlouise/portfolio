class ProjectsController < ApplicationController

  def index
    @ios_projects = IosProject.order('title ASC').paginate(page: params[:page], per_page: 4)
  end
  
end
