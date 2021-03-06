class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout :layout_by_resource

  def layout_by_resource
    if devise_controller? && resource_name == :user && action_name == 'new'
      "devise"
    else
      "application"
    end
  end

  def after_sign_up_path_for(resource)
    new_assessment_path
  end

  def after_sign_in_path_for(resource)
    if resource.class == Respondent
      new_assessment_path
    elsif resource.class ==  Admin
      rails_admin_path
    else
      new_assessment_path
    end
  end
end
