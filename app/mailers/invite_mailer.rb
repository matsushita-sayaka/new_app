class InviteMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.invite_mailer.sent.subject
  #
  def sent(invite)

    @invite = invite

    mail(to: @invite.email, subject: "「こそだてひろば」にあそびに来てね！")
  end
end
