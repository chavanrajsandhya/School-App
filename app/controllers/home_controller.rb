class HomeController < ApplicationController

  def index
    # if current_user.student_role?
      @courses = Course.all
    # end
  end

end
