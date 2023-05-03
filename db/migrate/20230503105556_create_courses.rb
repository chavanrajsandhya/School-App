class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.integer :course_fee

      t.timestamps
    end
  end
end
