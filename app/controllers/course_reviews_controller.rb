class CourseReviewsController < ApplicationController
  def index

  end

  def new
    @course = Course.find(params[:course_id])
    @review = CourseReview.new(user_id: current_user.id, course_id: params[:course_id])




    #  if user_signed_in?
    #   boat = Boat.find(params[:boat_id])
    #   start_date = params[:start_date]
    #   end_date = params[:end_date]
    #   @persons_going = params[:persons_going]
    #   price = (boat.price.to_i * (end_date.to_date - start_date.to_date)).to_i
    #   @booking = Booking.new(user_id: current_user.id,
    #                           boat_id: boat.id,
    #                           start_date: start_date,
    #                           end_date: end_date,
    #                           price: price)
    # else
    #   redirect_to new_user_session_path(redirect_to: new_boat_booking_path(id: params[:boat_id], price: params[:price],
    #                                     capacity: params[:capacity], start_date: params[:start_date], end_date: params[:end_date],
    #                                     persons_going: params[:persons_going]))
    # end
  end



  # create_table "course_reviews", force: :cascade do |t|
  #   t.string "title"
  #   t.text "content"
  #   t.integer "rating"
  #   t.bigint "user_id"
  #   t.bigint "course_id"
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  #   t.index ["course_id"], name: "index_course_reviews_on_course_id"
  #   t.index ["user_id"], name: "index_course_reviews_on_user_id"
  # end

  def create
    raise
  end
end
