class EmployeeMailer < ActionMailer::Base
  default from: "noreplay.eice@gmail.com"

  def welcome_email(employee)
    @employee = employee
   
    mail(to: @employee.email, subject: 'Welcome to My Eice ')
  end
end
