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
  end

end
