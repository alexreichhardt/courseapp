class CoursesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
    @bookmarked = false


    if user_signed_in?
      bookmark = Bookmark.where(user_id: current_user.id, course_id: params[:id])
      if !bookmark.empty?
        @bookmarked = true
      end
    end



  end

end
