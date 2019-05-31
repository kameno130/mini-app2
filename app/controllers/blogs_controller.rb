class BlogsController < ApplicationController

    before_action :redirect_to_index, :except => [:index]

  def index
    @blogs = Blog.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def show
    
    
   
  end

  def new
  end

  def create
  Blog.create(blog_params)
   
  end

  def destroy
    blog = Blog.find(params[:id])
    if blog.user_id == current_user.id
      blog.destroy
    end
    
  end

  def edit
    @blog = Blog.find(params[:id])
    
  end

  def update
    blog = Blog.find(params[:id])
    if blog.user_id == current_user.id
      blog.update(blog_params)
    end
  end


  private
  def blog_params
      params.permit(:image, :text).merge(user_id: current_user.id)
  
  end

  def id_params
   
  end

  def redirect_to_index
     redirect_to :action => "index" unless user_signed_in?
  end

end