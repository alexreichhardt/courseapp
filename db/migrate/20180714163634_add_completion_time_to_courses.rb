class AddCompletionTimeToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :completion_time, :string
  end
end
