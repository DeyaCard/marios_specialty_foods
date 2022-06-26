class ApplicationController < ActionController::Base
    before_action :authenicate_user!
    helper_method :is_admin?

    def is_admin?
      current_user && current_user.is_admin
    end
end
