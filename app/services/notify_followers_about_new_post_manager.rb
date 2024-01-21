class NotifyFollowersAboutNewPostManager
  attr_accessor :sender, :post

  def initialize(sender, post)
    @sender = sender
    @post = post
  end

  def proccess
    send_emails if valid_email_addresses?
  end

  private

  def send_emails
    email_addresses.each do |email_address|
      NotifyFollowersAboutNewPostWorker.perform_async(sender.id, post.id, email_address)
    end
  end

  def valid_email_addresses?
    invalid_email_addresses.empty?
  end

  def invalid_email_addresses
    @invalid_email_addresses = email_addresses.reject { |email_address| valid_email_address_format?(email_address) }
  end

  def valid_email_address_format?(email_address)
    EmailValidator.valid?(email_address)
  end

  def email_addresses
    @email_addresses ||= followers.map(&:email)
  end

  def followers
    @followers ||= sender.followers
  end
end
