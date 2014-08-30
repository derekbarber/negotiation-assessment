class Assessment < ActiveRecord::Base
  has_many :sections
  belongs_to :organization
end
