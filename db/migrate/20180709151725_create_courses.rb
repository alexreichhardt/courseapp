class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :title
      t.string :subtitle
      t.text :description
      t.integer :knowledge_level
      t.string :category
      t.string :price
      t.string :image
      t.jsonb :organization, default: '{}'
      t.integer :duration
      t.string :duration_unit
      t.string :url
      t.boolean :active, null: false, default: false
      t.string :language
      t.jsonb :instructor, default: '{}'

      t.timestamps
    end
  end
end
