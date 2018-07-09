class Course < ApplicationRecord
  enum knowledge_level: [:beginner, :intermediate, :advanced]
  has_many :bookmarks
  has_many :course_reviews
end
