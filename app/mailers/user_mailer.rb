class UserMailer < ActionMailer::Base
  default from: "noreply@story.com"

  def registration_confirmation user
    @user = user
    mail(:to => "#{user.display_name} <#{user.email}>", :subject => "Registered")
  end
end
