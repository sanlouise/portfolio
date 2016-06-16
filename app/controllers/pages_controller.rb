class PagesController < ApplicationController
  
  def home
  end
  
  def about
  end
  
  def portfolio 
  end 
  
  def portfolio2
  end
  
  def blog 
  end
  
  def contact
  end 
  
  def search
    @blogs = Blog.search(params[:search_blogs]).order("created_at DESC")
  end
  
  def ios_projects
    @ios_projects = IosProject.all 
  end
  
  def rails_projects
    @rails_projects = RailsProject.all
  end
  
end