require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
  end

  describe 'Associations' do
    it { should have_many(:followed_users).with_foreign_key('follower_id').class_name('UserRelationship') }
    it { should have_many(:following_users).with_foreign_key('followee_id').class_name('UserRelationship') }
    it { should have_many(:followees).through(:followed_users).dependent(:destroy) }
    it { should have_many(:followers).through(:following_users).dependent(:destroy) }
    it { should have_many(:posts) }
  end

  describe 'Scopes' do
    context '.all_except' do
      let!(:user1) { create(:user) }
      let!(:user2) { create(:user) }

      it 'returns all users except user1' do
        expect(described_class.all_except(user1)).not_to include(user1)
      end
    end
  end

  describe 'Instance methods' do
    context '#full_name' do
      let!(:user) { create(:user, first_name: 'John', last_name: 'Doe') }

      it 'returns users full name' do
        expect(user.full_name).to eq('John Doe')
      end
    end

    context '#follow' do
      let!(:follower) { create(:user) }
      let!(:followee) { create(:user) }

      it 'creates new UserRelationship' do
        expect { follower.follow(followee.id) }.to change(UserRelationship, :count).by(1)
      end

      it 'follower follows followee' do
        follower.follow(followee.id)
        expect(follower.following?(followee)).to be_truthy
      end
    end

    context '#unfollow' do
      let!(:follower) { create(:user) }
      let!(:followee) { create(:user) }

      before { follower.follow(followee.id) }

      it 'removes UserRelationship' do
        expect { follower.unfollow(followee.id) }.to change(UserRelationship, :count).by(-1)
      end

      it 'follower unfollows followee' do
        follower.unfollow(followee.id)
        expect(follower.following?(followee)).to be_falsey
      end
    end

    context '#following?' do
      let!(:follower) { create(:user) }
      let!(:followee) { create(:user) }

      context 'when follower follows followee' do
        it 'returns true' do
          follower.follow(followee.id)
          expect(follower.following?(followee)).to be_truthy
        end
      end

      context 'when follower does not follow followee' do
        it 'returns false' do
          expect(follower.following?(followee)).to be_falsey
        end
      end
    end
  end
end
