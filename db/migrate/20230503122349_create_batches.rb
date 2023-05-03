class CreateBatches < ActiveRecord::Migration[6.0]
  def change
    create_table :batches do |t|
      t.integer :course_id
      t.integer :student_id
      t.string :name
      t.datetime :start_time
      t.datetime :end_time
      t.integer :no_of_students

      t.timestamps
    end
  end
end
