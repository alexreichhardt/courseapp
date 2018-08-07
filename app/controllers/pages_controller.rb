class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @error = params[:error]
    @categories = CategoryHelper.categories
    @top_categories_count = CategoryHelper.top_categories
  end

end
