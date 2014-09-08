class RespondentsController < ApplicationController

  def create
    @respondent = Respondent.new

    if params.has_key?(:initial_signup)
      @respondent.send_signup_email(params[:respondent][:email])
      redirect_to root_url, :flash => { :notice => "Please check your Inbox for an email" }
    elsif params.has_key?(:access_code)
      respondent = Respondent.find_or_create_by(first_name: params[:respondent][:first_name], 
          last_name: params[:respondent][:last_name],
          email: params[:respondent][:email]
        )

      if respondent
        cookies[:respondent_id] = respondent.id

        organization = Organization.find_by(access_code: params[:access_code][:org])
        user = User.find_by(access_code: params[:access_code][:user])
        if organization && user
          assessment = Assessment.find_by(organization_id: organization.id, user_id: user.id, access_code: params[:access_code][:assessment])
        end
        if assessment

          response_values = {}
          assessment.questions.each do |question|
            response_values["question_#{question.id}"] = 0
          end
          respondent.responses = response_values
          respondent.save!

          redirect_to assessment
        else
          flash[:error] = "Couldn't find this assessment"
          render action: 'new'
        end
      end
    end
  end
  
  def new
    @respondent = Respondent.new
  end
end