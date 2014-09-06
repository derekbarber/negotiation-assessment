class Assessment < ActiveRecord::Base
  has_many :questions
  has_many :respondents
  belongs_to :organization
end
