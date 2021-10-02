class ApplicationController < ActionController::Base
    
    before_action :get_current_user

    private

    def get_current_user
        @user = User.find_by(id: session[:user_id])
    end

end
