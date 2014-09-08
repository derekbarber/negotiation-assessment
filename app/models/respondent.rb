class Respondent < ActiveRecord::Base
  belongs_to :organization
  belongs_to :user
  belongs_to :assessment

  def send_signup_email(email)
    require 'mandrill'
    m = Mandrill::API.new
    message = {
     :subject=> "Welcome to the Negotiation Assessment",
     :from_name=> "James Loewen",
     :text=>"Hi there,\n\nto get started with the negotiation assessment wizard, please click this link:\n\nhttp://negotiation-assessment.herokuapp.com/respondents/new",
     :to=>[
       {
         :email=> email
       }
     ],
     :html=>"<html><body><h1>Hi there,</h1><p>to get started with the negotiation assessment wizard, please click this link:</p>http://negotiation-assessment.herokuapp.com/respondents/new</body></html>",
     :from_email=>"sender@yourdomain.com"
    }
    sending = m.messages.send message
    puts sending
  end
end
