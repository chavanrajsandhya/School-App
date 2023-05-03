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


  def enroll
    binding.pry
    course = Course.where(id: params[:id]).last
    batches = course.batches
    # loop the batches and assign students by checking condition no_of_students
  end


end
