class ProjectsController < ApplicationController

  def index

    if !params[:project_type]
      @projects = Project.all.reverse

    elsif params[:project_type] == 'JavaScript'
      @projects = Project.where("project_type LIKE ?", '%js%').reverse

    elsif params[:project_type] == 'Ruby on Rails'
      @projects = Project.where("project_type LIKE ?", '%Rails%').reverse

    elsif params[:project_type] == 'iOS'
      @projects = Project.where("project_type LIKE ?", '%iOS%').reverse

    else
      @projects = Project.all.reverse

    end
  end
  
end
