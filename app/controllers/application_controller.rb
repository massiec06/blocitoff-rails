class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  protected
    def after_sign_in_path_for(resource)
      if current_user.present?
        stored_location_for(resource) || user_path(current_user) || root_path
      else
        super
      end
    end
end
