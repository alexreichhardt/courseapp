class BookmarksController < ApplicationController

  before_action :load_course

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def create
    @course.bookmark!(current_user.id)
  end

  def destroy
    @course.unbookmark!(current_user.id)
  end

  private

  def load_course
      @course = Course.find(params[:course_id])
    end
end
