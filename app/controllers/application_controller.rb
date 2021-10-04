class ApplicationController < ActionController::Base
    
    before_action :get_current_user

    def current_admin
        @current_user && @current_user.admin
    end

    private

    def get_current_user
        @current_user = User.find_by(id: session[:user_id])
        @current_admin = @current_user && @current_user.admin
    end

    def require_login
        if !@current_user
            redirect_to root_path
        end
    end

    def require_admin
        if !@current_user || !@current_user.admin
            redirect_to root_path
        end
    end

end
