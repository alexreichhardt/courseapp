class CoursesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]

  def index

    @search_input = params.dig(:criteria, :search)
    @error = ""
    @levels = params.dig(:criteria, :knowledge_level)
    @platforms = params.dig(:criteria, :platform)

    if @search_input.blank?
      # display all courses if user makes no input
      @courses = Course.page(params[:page]).per(10)


    elsif Course.search_global(@search_input).empty?
      @error = "The exact course you searched for could not be found, but here are some other courses you may be interested in."
      @courses = Course.all
    else
      # otherwise apply use search alogrithm
      @courses = Course.search_global(@search_input)
    end

    # FILTERS:

    # knowledge level
    if params.dig(:criteria, :knowledge_level)
        selected_options = params[:criteria][:knowledge_level].reject(&:blank?)
      if selected_options.blank?
        selected_options = ["beginner", "intermediate", "advanced"]
      end
      @courses = @courses.where(knowledge_level: [selected_options])
    end

    # platform
    if params.dig(:criteria, :platform)
      selected_options = params[:criteria][:platform].reject(&:blank?)
      if selected_options.blank?
        selected_options = ["Udemy", "Udacity", "Edx"]
      end
      @courses = @courses.where(platform: selected_options)
    end


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


end
