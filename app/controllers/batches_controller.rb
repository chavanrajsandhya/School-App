class BatchesController < ApplicationController
  active_scaffold :"batch" do |conf|
    conf.show.columns.exclude :student
    conf.list.columns.exclude :student
    conf.create.columns.exclude :student
    conf.update.columns.exclude :student
    conf.create.columns.exclude :student_id
  end
end
