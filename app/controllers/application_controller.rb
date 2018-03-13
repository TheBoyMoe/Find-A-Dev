class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  layout :layout_by_resource

  # redirect users to the profile following successful sign in if it has not been completed
  def after_sign_in_path_for(resource)
    if user_signed_in?
      if current_user.role == 'user'
        edit_user_path(current_user)
      else
        # user_path(current_user)
        welcome_path
      end
    end
  end


  private
    def layout_by_resource
      (devise_controller?)? "devise" : "application"
    end
end
