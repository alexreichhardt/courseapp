class CoursesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]

  def index

    if params[:criteria][:search].nil? || params[:criteria][:search] == ""
      @courses = Course.all
    else
      @courses = Course.search_global(params[:criteria][:search])
    end
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
