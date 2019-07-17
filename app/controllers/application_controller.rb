class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
=begin
  protect_from_forgery with: :exception
    def after_sign_in_path_for(resource)
      if resource.is_a?(User)
        if User.count == 2
          resource.add_role 'master'
        end
        resource
      end
      root_path
    end
=end

  protect_from_forgery with: :exception
  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
      if resource.role != nil
        resource.add_role resource.role
      elsif resource.email == "jim.song@icitymobile.com"
        resource.add_role 'admin'
      elsif resource.username == "master1" || resource.username == "master2" || resource.username == "master3"
        resource.add_role 'master'
      else
        resource.add_role "member"
      end
    end
    root_path
  end

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :role, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

end
