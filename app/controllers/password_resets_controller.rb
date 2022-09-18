class PasswordResetsController < ApplicationController
    def new
    end

    def create
        @user = User.find_by(email: params[:email])
        if @user.present?
            #send Email
            PasswordMailer.with(user: @user).reset.deliver_now
            #deliver_later does the mailing in the background
            #deliver-now send it right away but it will take processing speed from rails to do it
        end
        redirect_to root_path, notice: "If an account with that email was found, we have sent a link to reset your password"
    end

    def edit
        @user = User.find_signed!(params[:token], purpose: "password_reset")
    rescue ActiveSupport::MessageVerifier::InvalidSignature
        redirect_to sign_in_path, alert: "Your Token Has expired, please try again"
    end

    def update
        @user = User.find_signed!(params[:token], purpose: "password_reset")
        if @user.update(password_params)
            redirect_to sign_in_path, notice: "Your Password was reset successfully,Please sign in"
        else
            render :edit
        end
    end

    private
        def password_params
            params.require(:user).permit(:password, :password_confirmation)
        end
end