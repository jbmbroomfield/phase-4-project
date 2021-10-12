class SessionsController < ApplicationController

    def new
        @user = User.new
    end

    def create
        username = session_params[:username]
        password = session_params[:password]
        @user = User.find_by(username: username) || User.new
        if @user && password && password.length > 0 && @user.authenticate(password)
            session[:user_id] = @user.id
            redirect_to root_path
        else
            render :new
        end
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