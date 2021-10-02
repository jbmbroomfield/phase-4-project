class UsersController < ApplicationController
    
    def new
        @user = User.new
    end

    def create
        if user_params[:password] == params[:user][:password_confirmation]
            puts "11111111111111111111111111111111111"
            puts user_params
            @user = User.create(user_params)
            puts "333333333333333333333333333333333"
            puts @user
            puts @user.username
            puts @user.save
            session[:user_id] = @user.id
            redirect_to root_path
        else
            puts "222222222222222222222222222222222222"
            redirect_to new_user_path
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end

end