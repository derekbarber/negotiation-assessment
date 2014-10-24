RailsAdmin.config Question do
  list do
    field :question_text
    field :question_type
    field :assessment_style
    field :display_order
  end

  nestable_list( { :position_field => :display_order } )

  edit do
    field :assessment
    field :question_text
    field :question_type
    field :assessment_style
    field :leading_statement
    field :display_order
  end

  show do
    field :question_text
    field :question_type
    field :assessment_style
    field :display_order
  end
end
