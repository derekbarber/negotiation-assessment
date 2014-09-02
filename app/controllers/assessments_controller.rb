class AssessmentsController < ApplicationController

  def index
    @assessments = Assessment.all
  end

  def show
    @assessment = Assessment.find(params[:id])

    params.has_key?(:page) ? @page = params[:page].to_i : @page = 0

    @progress = (@page.to_f / @assessment.questions.count) * 100 if @page > 0

    @page > 0 ? @question = @assessment.questions.limit(1).offset(@page).first : @question = nil
  end

end