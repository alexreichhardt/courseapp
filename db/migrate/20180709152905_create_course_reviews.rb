class CreateCourseReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :course_reviews do |t|
      t.string :title
      t.text :content
      t.integer :rating
      t.references :user, foreign_key: true
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
