class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]

  # GET /blogs
  # GET /blogs.json
  def index
    @blogs = Blog.paginate(page: params[:page], per_page: 7)
  end
  
  def javascript
    @blogs = Blog.javascript
    render action: :index
  end 

  def ruby_on_rails
    @blogs = Blog.ruby_on_rails
    render action: :index
  end
  
  def personal_development
    @blogs = Blog.personal_development
    render action: :index
  end 
  
  def cs_fundamentals
    @blogs = Blog.cs_fundamentals
    render action: :index
  end

  def other
    @blogs = Blog.other
    render action: :index
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    @blogs = Blog.all
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end
  

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  
  def search
    if params[:blog]
      @blog ||= Stock.new_from_lookup(params[:stock])
    end
    
    if @blog
      # render json: @stock
      render partial: 'lookup'
    else
      render status: :not_found, nothing: true
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:title, :body, :image, :topic)
    end
end