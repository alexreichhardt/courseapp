class CoursesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]

  def index
    @courses = Course.all
  end

  def show
  end

end
