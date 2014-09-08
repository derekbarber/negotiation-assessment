class AssessmentsController < ApplicationController
  before_action :find_respondent, only: [:show, :update]

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
      @respondent.responses && @respondent.responses.has_key?("question_#{@question.id}") ?  @answer = @respondent.responses["question_#{@question.id}"] : @answer = 0
    end
  end

  private

  def find_respondent
    @respondent = Respondent.find(cookies[:respondent_id])
    unless @respondent
      redirect_to new_respondent_path
    end
  end
end