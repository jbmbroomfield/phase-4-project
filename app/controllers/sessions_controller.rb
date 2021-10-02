class SessionsController < ApplicationController

    def new
    end

    def create
        @user = User.find_by(username: session_params[:username])
        return head(:forbidden) unless @user && @user.authenticate(session_params[:password])
        session[:user_id] = @user.id
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end

    def facebook_create
        facebook_authentication = FacebookAuthentication.find_or_create_by(uid: auth['uid']) do |fa|
            fa.user = User.create(username: auth_info['name'], email: auth_info['email'])
        end

        @user = facebook_authentication.user
        session[:user_id] = @user.id
        redirect_to root_path
    end

    private

    def session_params
        params.require(:user).permit(:username, :password)
    end

    def auth
        request.env['omniauth.auth']
    end

    def auth_info
        auth['info']
    end

end