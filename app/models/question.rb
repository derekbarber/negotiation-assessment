class Question < ActiveRecord::Base
  belongs_to :assessment
  belongs_to :leading_statement

  default_scope { order('display_order') }

  def question_type_enum
    ['slider']
  end

  def assessment_style_enum
    ['Collaborative', 'Compete', 'Compromise', 'Abstain', 'Accommodate', 'Status Quo', 'Impose']
  end

  load Rails.root + 'app/rails_admin/question.rb'
end
