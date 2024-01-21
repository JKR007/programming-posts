class UserMailer < ApplicationMailer
  default from: 'programmingposts@example.com'

  def notify_followers_about_new_post(sender, post, email)
    @sender = sender
    @post = post
    @email = email

    mail(to: @email, subject: 'Programming Posts - New Post Published')
  end
end
