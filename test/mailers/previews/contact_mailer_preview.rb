# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/contact_mailer/reply_user
  def reply_user
    reply = 'ありがとう。ありがとう。ありがとう。ありがとう。ありがとう。ありがとう。'
    contact = Contact.first

    ContactMailer.reply_user(reply, contact)
  end

end
