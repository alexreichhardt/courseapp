class Course < ApplicationRecord
  enum knowledge_level: [:beginner, :intermediate, :advanced]
  has_many :bookmarks, dependent: :destroy
  has_many :course_reviews, dependent: :destroy
end
