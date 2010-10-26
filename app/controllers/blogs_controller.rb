class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
    @new_blog = Blog.new
  end

  def create
    Blog.create! params[:blog]
    redirect_to root_path
  end
end
