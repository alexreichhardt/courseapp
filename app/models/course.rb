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

end
