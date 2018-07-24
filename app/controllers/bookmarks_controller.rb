class BookmarksController < ApplicationController

  before_action :load_course

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def create
    if user_signed_in?
      @course.bookmark!(current_user.id)
    else
      redirect_to new_user_session_path(redirect_to: course_path(params[:id]))
    end
  end

  def destroy
    @course.unbookmark!(current_user.id)
  end

  private

  def load_course
    @course = Course.find(params[:course_id])
  end
end
