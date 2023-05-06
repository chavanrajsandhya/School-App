class CoursesController < ApplicationController
  load_and_authorize_resource

  active_scaffold :course do |conf|
    conf.columns = [:name, :start_date, :end_date, :course_fee]
    conf.show.columns.exclude :batch, :student
    conf.list.columns.exclude :batch, :student
    conf.create.columns.exclude :batch, :student
    conf.update.columns.exclude :batch, :student
    conf.create.columns.exclude :batch_id, :student_id
  end


  # def enroll
  #   binding.pry
  #   # user_batches = current_user.batches.where(course_id: params[:id]).last
  #   # if user_batches.present?
  #   #   flash[:error] = "Already assigned to Batch #{batch_number} for Course #{course_name}"
  #   # else
  #     course = Course.where(id: params[:id]).last
  #     batches = course.batches
  #     # loop the batches and assign students by checking condition no_of_students
  #     batches.each do |batch|
  #       if batch.enrolled_students.present?
  #         students = batch.enrolled_students.pluck(:student_id)
  #         stu = students.find{|s| s[:student_id] == current_user.id}
  #         if students.include?(current_user.id) && stu.present? && stu[:is_approved]
  #           flash[:error] = "Already assigned to Batch #{batch_number} for Course #{course_name}"
  #         else
  #           if students.count < batch.no_of_students
  #             batch.enrolled_students["student_id"] = ["#{current_user.id}"] 
  #             batch.enrolled_students["is_approved"] = false
  #             flash[:notice] = "Succcessfully Enrolled !!"
  #             break
  #           end
  #         end
  #       else
  #         batch.enrolled_students = []
  #         student_hash = {}
  #         student_hash["student_id"] = ["#{current_user.id}"] 
  #         student_hash["is_approved"] = false
  #         batch.enrolled_students << student_hash
  #         flash[:notice] = "Succcessfully Enrolled !!"
  #         break
  #       end
  #     end
  #   # end
  # end


end
