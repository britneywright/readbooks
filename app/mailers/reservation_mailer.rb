class ReservationMailer < ActionMailer::Base
  default from: "blw06g@gmail.com"
  
  def confirmation_email(status)
    @status = status
    mail(to: @status.borrower_email, subject: "Rails Girls DC Library Request Received")
  end
end
