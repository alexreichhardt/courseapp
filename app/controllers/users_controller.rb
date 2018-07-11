class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @reviews = CourseReview.where(user_id: params[:id])
    bookmark_ids = Bookmark.where(user_id: params[:id])
    @courses = []
    @reviews
    bookmark_ids.each do |id|
      @courses << Course.where(id: id.course_id)
    end


  end

  def edit_avatar
    @user = User.new
  end

  def new_avatar
    @user = User.where(id: current_user.id)
    @user.update(user_params)
    redirect_to user_path(current_user.id)
  end


  def edit
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit( :avatar)
  end
end
