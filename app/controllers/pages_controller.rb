class PagesController < ApplicationController
  
  def home
  end
  
  def about
  end
  
  def search
    @blogs = Blog.search(params[:search_blogs]).order("created_at DESC")
  end
  
end