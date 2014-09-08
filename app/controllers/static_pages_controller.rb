class StaticPagesController < ApplicationController
  def home
    @respondent = Respondent.new
  end

  def about
  end
end
