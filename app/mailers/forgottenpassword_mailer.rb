class ForgottenpasswordMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.forgottenpassword_mailer.reset.subject
  #
  def reset
    @token = params[:user].signed_id(purpose: "password_reset", expires_in: 10.minutes)

    mail to: params[:user].email
  end
end
