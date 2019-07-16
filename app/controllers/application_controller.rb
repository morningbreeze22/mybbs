class ApplicationController < ActionController::Base

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




  protected

  def authenticate_admin
    unless current_user.admin?
      redirect_to root_path
    end
  end

=end

end
