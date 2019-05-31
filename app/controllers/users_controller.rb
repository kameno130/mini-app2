class UsersController < ApplicationController
  @nickname = current_user.nickname
  @blogs = current_user.blogs.page(params[:page]).per(5).order("created_at DESC")
end
