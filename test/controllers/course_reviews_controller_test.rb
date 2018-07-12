require 'test_helper'

class CourseReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get course_reviews_new_url
    assert_response :success
  end

  test "should get create" do
    get course_reviews_create_url
    assert_response :success
  end

end
