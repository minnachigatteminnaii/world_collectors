class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.reply_user.subject
  #
  def reply_user(reply, contact)
    @reply = reply
    @contact = contact

    mail to: @contact.user.email, 
        subject:"World Collectorsから、お問い合わせ（#{@contact.title}）に対する返信。"
  end
end
