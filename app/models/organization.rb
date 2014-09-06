class Organization < ActiveRecord::Base
  has_many :assessments
  has_many :users
  has_many :respondents
end
