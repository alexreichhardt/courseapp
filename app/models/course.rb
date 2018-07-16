class Course < ApplicationRecord
  enum knowledge_level: [:beginner, :intermediate, :advanced, :undetermined]
  has_many :bookmarks, dependent: :destroy
  has_many :course_reviews, dependent: :destroy

  #validates :platform_id, uniqueness: true

  # paginates_per 100

  include PgSearch

  pg_search_scope :search_global, against: { title: 'A', subtitle: 'B', description: 'C' },
                                  using: {
                                          tsearch: { prefix: true, any_word: true },
                                          }

  # pg_search_scope :search_by_title, against: :title
  # pg_search_scope :search_by_description, against: :description

  def avg_rating
    all_reviews = CourseReview.where(course_id: self.id)
    all_reviews = all_reviews.to_a
    all_ratings = all_reviews.map { |course| course.rating}

    return nil if all_ratings.empty?
    sum_of_ratings = all_ratings.inject(0){|sum, x| sum + x }

    (sum_of_ratings.to_f / all_ratings.size.to_f).round(1)
  end

  def sum_ratings

    all_reviews = CourseReview.where(course_id: self.id)
    all_reviews = all_reviews.to_a
    all_ratings = all_reviews.map { |course| course.rating}

    all_ratings.count
  end

end





