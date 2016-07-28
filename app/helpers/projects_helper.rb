module ProjectsHelper
	def filter_projects(project_type)
		if !params[:project_type]
      @projects = Project.all

    elsif params[:project_type] == 'JavaScript'
      @projects = Project.where("project_type LIKE ?", '%JavaScript%').reverse

    elsif params[:project_type] == 'Ruby on Rails'
      @projects = Project.where("project_type LIKE ?", '%Rails%').reverse

    elsif params[:project_type] == 'iOS'
      @projects = Project.where("project_type LIKE ?", '%iOS%').reverse

    else
      @projects = Project.all

    end
  end
end

