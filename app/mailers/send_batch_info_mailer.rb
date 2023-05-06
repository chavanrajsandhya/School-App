class SendBatchInfoMailer < ApplicationMailer
  default from: 'myfakestore@email.com'

  def send_batch_info_email
    binding.pry
    @student = User.where(id: params[:student_id]).last
    @batch = Batch.where(id: params[:batch_id]).last
    mail(to: @student.email, subject: "You have assigned to a Batch !!")
  end

end
