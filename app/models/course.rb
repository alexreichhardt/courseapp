class Course < ApplicationRecord
  CATEGORIES = ["Web Development", "Mobile Apps", "Programming Languages", "Game Development", "Databases",
                "Software Testing", "Software Engineering", "Development Tools", "Front-end & Design", "DevOps",
                "Security", "Data-Analysis", "Ruby", "Python", "Java", "React", "C++", "Spring", "Node.js", "Tensorflow", "Angular", "Php", "Scala", "Swift", "Javascript", "Blockchain" ,"Solidity", "Ethereum", "Crypto"]



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

  def display_categories
    self.categories["subjects"].join(', ')
  end

  def bookmarked?(user_id) # input: user_id
    Bookmark.where(user_id: user_id, course_id: self.id).present?
  end

  def bookmark!(user_id) # input: user_id
    b = Bookmark.new(user_id: user_id, course_id: self.id)
    b.save!
  end

  def unbookmark!(user_id)
    b = Bookmark.find_by(user_id: user_id, course_id: self.id)
    b.destroy!
  end


end





