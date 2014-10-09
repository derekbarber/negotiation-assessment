class RespondentsController < ApplicationController
  before_filter :authenticate_respondent!

  def edit
    @respondent = current_respondent
  end

  def update
    if params[:respondent][:password].blank?
      params[:respondent].delete(:password)
      params[:respondent].delete(:password_confirmation)
    end

    @respondent = current_respondent

    respond_to do |format|
      if @respondent.update(respondent_params)
        format.html { redirect_to edit_respondent_path(@respondent), notice: 'Your account was successfully updated.' }
      else
        Rails.logger.info(@respondent.errors.inspect) 
        render action: 'edit'
      end
    end
  end

  private

  def respondent_params
    params.require(:respondent).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end