class ApplicationController < ActionController::Base
   before_action :current_user

   def current_user
        if session[:id]
        Current.user = User.find_by(id: session[:id])
        end
    end
end
