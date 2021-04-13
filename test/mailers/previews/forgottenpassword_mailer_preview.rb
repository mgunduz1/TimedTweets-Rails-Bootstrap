# Preview all emails at http://localhost:3000/rails/mailers/forgottenpassword_mailer
class ForgottenpasswordMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/forgottenpassword_mailer/reset
  def reset
    ForgottenpasswordMailer.reset
  end

end
