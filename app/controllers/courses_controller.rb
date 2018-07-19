class CoursesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index, :categories]


  def index
    @search_input = params.dig(:criteria, :search)
    @error = ""
    @levels = params.dig(:criteria, :knowledge_level)
    @platforms = params.dig(:criteria, :platform)
    @prices = params.dig(:criteria, :price)
    @completion_times = params.dig(:criteria, :completion_time)



    if @search_input.blank?
      # display all courses if user makes no input
      @courses = Course.includes(:bookmarks).page(params[:page]).per(10)

    elsif Course.search_global(@search_input).empty?
      @error = "The exact course you searched for could not be found, but here are some other courses you may be interested in."
      @courses = Course.includes(:bookmarks).page(params[:page]).per(10)
    else
      # otherwise apply use search alogrithm
      @courses = Course.search_global(@search_input)
      @courses = @courses.page(params[:page]).per(10)
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
        selected_options = ["udemy", "udacity", "edx"]
      end
      @courses = @courses.where(platform: selected_options)
    end

    # price

    # if @prices
    if params.dig(:criteria, :price)
      selected_options = params[:criteria][:price].reject(&:blank?)
      if selected_options.blank? || selected_options.count == 2
        @courses = @courses # .where("price >= 0")
      elsif selected_options[0] == "Paid"
        @courses = @courses.where("price > 0 OR price is null" )
      elsif selected_options[0] == "Free"
        @courses = @courses.where("price = 0")
      end
    end
    # end

    # completion time
    if @completion_times
      selected_options = params[:criteria][:completion_time]&.reject(&:blank?)
      if selected_options[0] == "> 1 week"
        @courses = @courses.where("completion_time = 'long'")
      elsif selected_options[0] == "< 1 week"
        @courses = @courses.where("completion_time = 'short'")
      # else if selected_options.blank? || selected_options.count == 2
      end
    end
  end


  def show

    @search_input = params.dig(:criteria, :search)
    @error = ""
    @levels = params.dig(:criteria, :knowledge_level)
    @platforms = params.dig(:criteria, :platform)
    @prices = params.dig(:criteria, :price)
    @completion_times = params.dig(:criteria, :completion_time)

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

  def categories
    category_hash = {
      "web_development" => ["Web Development", "category_images/web_development.jpeg"],
      "mobile_apps" => ["Mobile Apps", "category_images/mobile_apps.jpeg"],
      "programming_languages" => ["Programming Languages", "category_images/programming_languages.jpg"],
      "game_development" => ["Game Development","category_images/game_development.jpeg"],
      "database" => ["Databases","category_images/databases.jpeg"],
      "software_testing" => ["Software Testing", "category_images/software_testing.jpeg"],
      "software_engineering" => ["Software Engineering", "category_images/software_engineering.jpeg"],
      "development_tools" => ["Development Tools", "category_images/development_tools.jpeg"],
      "front_end" => ["Front-end & Design", "category_images/front-end_design.png"],
      "Dev_ops" => ["DevOps","category_images/devops.jpeg"],
      "security" => ["Security", "category_images/security.jpeg"],
      "data_analysis" => ["Data Analysis", "category_images/data_analysis.jpeg"],
    }

    category_hash.each do |category, array|
      array << category_course_count(category)
    end

    # top four categories based on course count
    @top_categories_count = category_hash.sort_by { |a| -a[1][2] }[0..3]

    @categories = (category_hash.to_a - @top_categories_count.to_a).to_h
  end

  private

  def category_course_count(category)
    courses_in_category = Course.where("categories->'categories' ? :value", value: "#{category}")
    return courses_in_category.count
  end

  # def top_categories_on_count(category_hash)
  #  category_hash.sort_by { |a| a[2] }[0..3]
  # end


end
