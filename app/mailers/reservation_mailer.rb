class ReservationMailer < ActionMailer::Base
  default from: "britney@britneywright.com"
  
  def confirmation_email(status)
    @status = status
    mail(to: @status.borrower_email, subject: "Rails Girls DC Library Request Received")
  end

  def request_email(status)
    @status = status
    mail(to: "blw06g@gmail.com", subject: "Rails Girls DC Library Request Received")
  end
end
