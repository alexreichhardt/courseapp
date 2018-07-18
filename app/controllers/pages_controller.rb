class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @error = params[:error]
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
end
