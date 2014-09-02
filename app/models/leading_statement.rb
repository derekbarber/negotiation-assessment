class LeadingStatement < ActiveRecord::Base
  belongs_to :assessment
  belongs_to :question
end
