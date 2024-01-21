class NotifyFollowersAboutNewPostWorker
  include Sidekiq::Worker
  sidekiq_options queue: :default

  def perform(sender_id, post_id, email)
    sender = User.find(sender_id)
    post = Post.find(post_id)
    UserMailer.notify_followers_about_new_post(sender, post, email).deliver_now!
  end
end
