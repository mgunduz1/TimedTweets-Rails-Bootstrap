class PasswordResetsController < ApplicationController

    def new
    end

    def create
        @user = User.find_by(email: params[:email])
        
        if @user.present?
            ForgottenpasswordMailer.with(user: @user).reset.deliver_now
           
        end
        redirect_to root_path, notice: "If there is a registered account with that email adress, we sent a link in order to reset your password."
    end

    def edit
        @user = User.find_signed!(params[:token], purpose: "password_reset")
    rescue ActiveSupport::MessageVerifier::InvalidSignature
        redirect_to root_path, alert: "Your link has expired. Please request another password reset link."
    end

    def update
        @user = User.find_signed!(params[:token], purpose: "password_reset")
        if @user.update(password_params)
            redirect_to sign_in_path, notice: "Your password reset succesfully."
        else
            render :edit
        end
    end

private

def password_params
  params.require(:user).permit(:password, :password_confirmation)
end

end