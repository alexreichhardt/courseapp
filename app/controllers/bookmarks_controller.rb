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


      if URI(request.referer).path == "/courses"
        redirect_to URI(request.referer).to_s + "#course#{params[:course_id]}"
      elsif URI(request.referer).path == "/courses/#{params[:course_id]}"
        redirect_to request.referer
      end

      # (anchor: 'contact' )
    end
  end

  def destroy
    bookmark = Bookmark.find(params[:id])
    bookmark.delete
    # redirect_to course_path(params[:course_id])
    redirect_to request.referrer

  end

end
