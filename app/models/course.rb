class Course < ApplicationRecord
  enum knowledge_level: [:beginner, :intermediate, :advanced]
  has_many :bookmarks, dependent: :destroy
  has_many :course_reviews, dependent: :destroy
  include PgSearch

  pg_search_scope :search_global, against: { title: 'A', subtitle: 'B', description: 'C' },
                                  using: {
                                          tsearch: { prefix: true, any_word: true },
                                          }

  # pg_search_scope :search_by_title, against: :title
  # pg_search_scope :search_by_description, against: :description

end
