require 'rails_helper'

RSpec.describe NotifyFollowersAboutNewPostManager do
  let!(:user) { create(:user, email: 'user@example.com') }
  let!(:user_follower1) { create(:user, email: 'user_follower1@example.com') }
  let!(:user_follower2) { create(:user, email: 'user_follower2@example.com') }
  let!(:user_relationship1) { create(:user_relationship, follower: user_follower1, followee: user) }
  let!(:user_relationship2) { create(:user_relationship, follower: user_follower2, followee: user) }

  let!(:post) { create(:post, :published, title: 'Post For Notify', author: user) }

  subject(:service) { described_class.new(user, post) }
  let!(:run_service) { -> { service.process } }

  describe 'proccess' do
    it 'calls NotifyFollowersAboutNewPostWorker' do
      expect(NotifyFollowersAboutNewPostWorker).to receive(:perform_async)
      run_service

      expect(NotifyFollowersAboutNewPostWorker).to receive(:perform_async).with(user.id, post.id, user_follower2.email)
      run_service
    end
  end
end
