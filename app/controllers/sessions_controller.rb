class SessionsController < ApplicationController

    def facebook_create
        facebook_authentication = FacebookAuthentication.find_or_create_by(uid: auth['uid']) do |fa|
            fa.user = User.create(username: auth_info['name'], email: auth_info['email'])
        end

        @user = facebook_authentication.user
        session[:user_id] = @user.id
        redirect_to root_path
    end

    private

    def auth
        request.env['omniauth.auth']
    end

    def auth_info
        auth['info']
    end

end