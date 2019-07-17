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
      if resource.email == "jim.song@icitymobile.com"
        resource.add_role 'admin'
      end
      resource
    end
    root_path
  end
=begin

  protected

  def authenticate_admin
    unless current_user.admin?
      redirect_to root_path
    end
  end

=end

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

end
