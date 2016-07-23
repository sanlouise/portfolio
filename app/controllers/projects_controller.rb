class ProjectsController < ApplicationController

  def index
    @projects = Project.order('title ASC').paginate(page: params[:page], per_page: 10)
  end

  def javascript
  	@js_projects = Project.where('project_type = "JavaScript"').paginate(page: params[:page], per_page: 10)
  end

  def ios
  	@ios_projects = Project.where('project_type = "iOS"').paginate(page: params[:page], per_page: 10)
  end

  def rails
  	@rails_projects = Project.where('project_type = "Ruby on Rails"').paginate(page: params[:page], per_page: 10)
  end
  
end
