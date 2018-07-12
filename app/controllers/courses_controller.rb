class CoursesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]

  def index

    @search_input = params[:criteria][:search]

    if @search_input.nil? || @search_input == ""
      # display all courses if user makes no input
      @courses = Course.all
    else
      # otherwise apply use search alogrithm
      @courses = Course.search_global(@search_input)

    end
    # FILTERS:

    # knowledge level
    if params[:criteria].has_key?(:knowledge_level)
      selected_options = params[:criteria][:knowledge_level].map { |n| n if n != ""}
      @courses = @courses.where(knowledge_level: [selected_options])
    end

    # plattform
    # if params[:criteria].has_key?(:plattform)
    #   selected_options = params[:criteria][:plattform].map { |n| n }
    #   @courses = @courses.where(knowledge_level: [selected_options])
    # end

    # price

  end

  def show

    @course = Course.find(params[:id])
    @bookmarked = false
    @reviews = CourseReview.where(course_id: params[:id])

    if user_signed_in?
      bookmark = Bookmark.where(user_id: current_user.id, course_id: params[:id])
      if !bookmark.empty?
        @bookmarked = true
      end
    end
  end

    @reviews = CourseReview.all.where(course_id: params[:id])



end
