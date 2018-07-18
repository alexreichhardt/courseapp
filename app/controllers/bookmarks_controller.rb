class BookmarksController < ApplicationController
  def show
    @bookmark = Bookmark.find(params[:id])

  end

  def create
    if user_signed_in?
      course = Course.find(params[:course_id])
      new_bookmark = Bookmark.new(user_id: current_user.id, course_id: course.id)
      new_bookmark.save!
      # redirect_to course_path(params[:course_id])
      redirect_to request.referrer

    else
       redirect_to new_user_session_path(redirect_to: course_path(params[:id]))
    end
  end

  def destroy
    bookmark = Bookmark.find(params[:id])
    bookmark.delete
    # redirect_to course_path(params[:course_id])
    redirect_to request.referrer

  end

end
