class EnrolledStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :batches, :enrolled_students, :text
  end
end
