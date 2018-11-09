class ContactMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.invite_mailer.sent.subject
  #
  def sent(user)

    @user= user

    mail(to: @user.email, subject: "メッセージが届きました")
  end
end
