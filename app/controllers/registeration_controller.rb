class RegisterationController < ApplicationController
    def new
        @user = User.new
        # @ makes it that variable can be seen by views
    end

    def create
        #render plain: "Thanks"
        #maybe a way to check inside the methods
      #  render plain: params[:user]
      @user = User.new(user_params)

      if @user.save
        session[:user_id] = @user.id
        #this keeps tabs of sign-ins by users by using cookies
        redirect_to root_path, notice:"Successfully created account"
      else
        render :new
      end
    end

    private

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
