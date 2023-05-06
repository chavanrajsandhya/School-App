module HomeHelper

  def is_student_enrolled?(course)
    batches = Batch.where(course_id: course.id).select(:enrolled_students)
    enrolled = false
    batches.each do |batch|
      if batch.enrolled_students.present?
        students = batch.enrolled_students.pluck("student_id")
        enrolled = true if students.include?(current_user.id.to_s)
        break
      end
    end
    enrolled
  end

end
