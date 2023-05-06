class HomeController < ApplicationController

  def index
    @courses = Course.all
  end

  def enroll
    begin
      course = Course.where(id: params[:id]).last
      batches = course.batches
      batches.each do |batch|
        if batch.enrolled_students.present?
          students = batch.enrolled_students.pluck("student_id")
          stu = students.find{|s| s["student_id"].to_i == current_user.id}
          if students.include?(current_user.id.to_s) && stu.present? && stu[:is_approved]
            flash[:error] = "Already assigned to Batch #{batch.name} for Course #{course.name}"
          else
            if students.count < batch.no_of_students
              assign_student_to_batch(batch)
              flash[:notice] = "Succcessfully Enrolled !!"
              break
            end
          end
        else
          assign_student_to_batch(batch)
          flash[:notice] = "Succcessfully Enrolled !!"
          break
        end
      end
    rescue StandardError => e
    end
  end


  def assign_student_to_batch(batch)
    batch.enrolled_students = batch.enrolled_students.present? ? batch.enrolled_students : []
    student_hash = {}
    student_hash["student_id"] = current_user.id
    student_hash["is_approved"] = false
    batch.enrolled_students << student_hash
    batch.save!
    batch
  end

  def approve_student_batches
    @batches = Batch.pluck(:name, :id)
    @batches << ["--Select--", ""]
  end


  def show_students
    @batch = Batch.where(id: params[:batch_id]).last
    @course = @batch.course
    @enrolled_students = @batch.enrolled_students
    student_ids = @enrolled_students.present? ? @enrolled_students.pluck("student_id").uniq.map(&:to_i) : []
    @users_hash = User.where(id: student_ids).pluck(:id, :name).to_h
  end

  def approve_enrollment
    @batch = Batch.where(id: params[:batch_id]).last
    stu = @batch.enrolled_students.find{|s| s["student_id"] == params["student_id"]}
    stu["is_approved"] = true
    if @batch.save
      SendBatchInfoMailer.with(student_id: params["student_id"], batch_id: @batch.id).send_batch_info_email.deliver_now
    end
  end

end
