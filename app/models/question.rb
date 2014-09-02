class Question < ActiveRecord::Base
  belongs_to :assessment
  has_one :leading_statement

  default_scope { order('display_order') }
end
