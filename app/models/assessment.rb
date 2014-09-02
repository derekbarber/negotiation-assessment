class Assessment < ActiveRecord::Base
  has_many :questions
  belongs_to :organization
end
