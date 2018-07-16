class CourseReview < ApplicationRecord
  belongs_to :user
  belongs_to :course
  validates :rating, inclusion: { in: [ 1, 2, 3, 4, 5] }

end
