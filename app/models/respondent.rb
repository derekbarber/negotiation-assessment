class Respondent < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :organization
  belongs_to :user
  belongs_to :assessment

  def password_required?
    super if confirmed?
  end

  def password_match?
    self.errors[:password] << "can't be blank" if password.blank?
    self.errors[:password_confirmation] << "can't be blank" if password_confirmation.blank?
    self.errors[:password_confirmation] << "does not match password" if password != password_confirmation
    password == password_confirmation && !password.blank?
  end

  # new function to set the password without knowing the current password used in our confirmation controller. 
  def attempt_set_password(params)
    p = {}
    p[:password] = params[:password]
    p[:password_confirmation] = params[:password_confirmation]
    update_attributes(p)
  end
  # new function to return whether a password has been set
  def has_no_password?
    self.encrypted_password.blank?
  end

  # new function to provide access to protected method unless_confirmed
  def only_if_unconfirmed
    pending_any_confirmation {yield}
  end

  def password_required?
    # Password is required if it is being set, but not for new records
    if !persisted? 
      false
    else
      !password.nil? || !password_confirmation.nil?
    end
  end

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
     :html=>"<html><h1>Hi there,</h1><p>to get started with the negotiation assessment wizard, please click this link:</p>http://negotiation-assessment.herokuapp.com/respondents/new</html>",
     :from_email=>"derek@smartsettle.com"
    }
    sending = m.messages.send message
    puts sending
  end
  
end
