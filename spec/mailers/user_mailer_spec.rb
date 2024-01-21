require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  let!(:user) { create(:user, first_name: 'Firstname', last_name: 'Lastname', email: 'user@example.com') }

  describe 'notify_followers_about_new_post' do
    let!(:post) { create(:post, :published, author: user, title: 'Post title') }
    let!(:follower) { create(:user, email: 'follower@example.com') }
    let!(:user_relationship) { create(:user_relationship, follower: follower, followee: user) }

    subject(:mail) { UserMailer.notify_followers_about_new_post(user, post, follower.email) }

    it 'renders subject' do
      expect(mail.subject).to eq('Programming Posts - New Post Published')
    end

    it 'renders recipient email' do
      expect(mail.to).to contain_exactly('follower@example.com')
    end

    it 'renders sender email' do
      expect(mail.from).to contain_exactly('programmingposts@example.com')
    end

    it 'renders email header' do
      expect(mail.body.encoded).to include 'Firstname Lastname has created new Post'
    end

    it 'renders post title' do
      expect(mail.body.encoded).to include 'Post title'
    end

    it 'renders link to post' do
      expect(mail.body.encoded).to include post_url(post)
    end
  end
end
