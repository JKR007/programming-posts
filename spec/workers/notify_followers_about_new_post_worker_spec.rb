require 'rails_helper'

RSpec.describe NotifyFollowersAboutNewPostWorker do
  let!(:user) { create(:user, email: 'user@example.com') }
  let!(:user_follower1) { create(:user, email: 'user_follower1@example.com') }
  let!(:user_follower2) { create(:user, email: 'user_follower2@example.com') }
  let!(:user_relationship1) { create(:user_relationship, follower: user_follower1, followee: user) }
  let!(:user_relationship2) { create(:user_relationship, follower: user_follower2, followee: user) }

  let!(:post) { create(:post, :published, title: 'Post For Notify', author: user) }

  let!(:worker) { described_class.new }
  let(:performer) { ->(sender_id, post_id, email_address) { worker.perform(sender_id, post_id, email_address) } }

  it 'is processed in default queue' do
    expect(NotifyFollowersAboutNewPostWorker).to be_processed_in :default
  end

  describe '.perform' do
    it 'sends email' do
      expect { performer.call(user.id, post.id, user_follower1.email) }.to change {
        ActionMailer::Base.deliveries.count
      }.by(1)
    end

    it 'creates creates NotifyFollowersAboutNewPostWorker' do
      expect { described_class.perform_async(user.id, post.id, user_follower1.email) }.to change { NotifyFollowersAboutNewPostWorker.jobs.size }.by(1)
    end
  end
end
