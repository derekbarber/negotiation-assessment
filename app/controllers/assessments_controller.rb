class AssessmentsController < ApplicationController
  before_action :find_respondent, only: [:show, :update]


  def create
    if (params.has_key?(:first_name) && params.has_key?(:last_name))
      respondent = Respondent.find(current_respondent.id)
      respondent.first_name = params[:first_name]
      respondent.last_name = params[:last_name]
      response_values = {}
      assessment.questions.each do |question|
        response_values["question_#{question.id}"] = 0
      end
      respondent.responses = response_values
      respondent.save
    end

    if params.has_key?(:access_code)
      organization = Organization.find_by(access_code: params[:access_code][:org])
      user = User.find_by(access_code: params[:access_code][:user])
      if organization && user
        assessment = Assessment.find_by(organization_id: organization.id, user_id: user.id, access_code: params[:access_code][:assessment])
      end
      if assessment
        redirect_to assessment
      else
        flash[:error] = "Couldn't find this assessment"
        redirect_to new_assessment_path
        #render action: 'new'
      end
    end
  end

  def new
    @assessment = Assessment.new
    @respondent = current_respondent
  end

  def update
    @assessment = Assessment.find(params[:id])

    question_id = params[:question_id]

    Rails.logger.debug "Question Param: question_#{question_id}"

    @respondent.responses["question_#{question_id}"] = params["question_#{question_id}"]
    @respondent.responses_will_change!
    @respondent.save!

    Rails.logger.debug @respondent.inspect

    redirect_to assessment_path(@assessment, :page => params[:page])
  end

  def show
    @assessment = Assessment.find(params[:id])

    params.has_key?(:page) ? @page = params[:page].to_i : @page = 0

    @progress = (@page.to_f / @assessment.questions.count) * 100 if @page > 0

    @page > 0 ? @question = @assessment.questions.limit(1).offset(@page).first : @question = nil

    if @question
      @leading_statement = LeadingStatement.find(@question.leading_statement_id)
      @respondent.responses && @respondent.responses.has_key?("question_#{@question.id}") ?  @answer = @respondent.responses["question_#{@question.id}"] : @answer = 0
    end
  end

  private

  def find_respondent
    @respondent = Respondent.find(current_respondent)
  end
end