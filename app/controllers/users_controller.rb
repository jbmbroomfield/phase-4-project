class UsersController < ApplicationController
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
            if User.all.count == 0
                @user.admin = true
            end
            @user.save
            redirect_to root_path
        else
            render :new
        end
        # if user_params[:password] == params[:user][:password_confirmation]
        #     @user = User.create(user_params)
        #     if User.all.count <= 1
        #         @user.admin = true
        #         @user.save
        #     end
        #     session[:user_id] = @user.id
        #     redirect_to root_path
        # else
        #     redirect_to new_user_path
        # end
    end

    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end

end