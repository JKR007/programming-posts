require 'rails_helper'

RSpec.describe NotifyFollowersAboutNewPostManager do
  let!(:user) { create(:user, email: 'user@example.com') }
  let!(:user_follower1) { create(:user, email: 'user_follower1@example.com') }
  let!(:user_follower2) { create(:user, email: 'user_follower2@example.com') }
  let!(:user_relationship1) { create(:user_relationship, follower: user_follower1, followee: user) }
  let!(:user_relationship2) { create(:user_relationship, follower: user_follower2, followee: user) }

  let!(:post) { create(:post, :published, title: 'Post For Notify', author: user) }

  subject(:service) { described_class.new(user, post) }

  describe 'proccess' do
    it 'calls NotifyFollowersAboutNewPostWorker' do
      expect(NotifyFollowersAboutNewPostWorker).to receive(:perform_async).with(user.id, post.id, user_follower1.email)
      expect(NotifyFollowersAboutNewPostWorker).to receive(:perform_async).with(user.id, post.id, user_follower2.email)
      service.proccess
    end

    it 'returns valid eamils' do
      expect(service.proccess).to match_array(['user_follower1@example.com', 'user_follower2@example.com'])
    end

    context 'when invalid eamils' do
      before do
        user_follower1.update(email: 'user_follower1@example')
        user_follower2.update(email: 'user_follower2@example')
      end

      it 'does not call NotifyFollowersAboutNewPostWorker' do
        expect(NotifyFollowersAboutNewPostWorker).not_to receive(:perform_async).with(user.id, post.id, user_follower1.email)
        expect(NotifyFollowersAboutNewPostWorker).not_to receive(:perform_async).with(user.id, post.id, user_follower2.email)
        service.proccess
      end
    end
  end
end
