class Batch < ApplicationRecord
  belongs_to :course, foreign_key: :course_id, optional: true
  belongs_to :student, :class_name => "User", :foreign_key => "student_id", optional: true

  serialize :enrolled_students
end
