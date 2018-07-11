class Course < ApplicationRecord
  enum knowledge_level: [:beginner, :intermediate, :advanced]
  has_many :bookmarks, dependent: :destroy
  has_many :course_reviews, dependent: :destroy
  include PgSearch

  pg_search_scope :search_global, against: [ :title, :description, :subtitle ],
                  using: {
                    tsearch: { prefix: true }
                  }

  # pg_search_scope :search_by_title, against: :title
  # pg_search_scope :search_by_description, against: :description
end
