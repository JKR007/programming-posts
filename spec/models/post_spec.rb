require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:title) }
  end

  describe 'Associations' do
    it { should have_rich_text(:content) }
    it { should have_many(:histories) }
    it { should belong_to(:author).with_foreign_key('user_id').class_name('User').optional }
  end

  describe 'Scopes' do
    context '.published?' do
      let!(:post1) { create(:post, :published) }
      let!(:post2) do
        Timecop.freeze 1.days.ago do
          create(:post, :published)
        end
      end

      it 'returns all users except user1' do
        expect(described_class.published).to match_array([post1, post2])
      end
    end
  end

  describe 'Callbacks' do
    it { is_expected.to callback(:notify_author_followers).after(:commit).if(:persisted? && :published_at_changed?) }
  end

  describe 'Instance methods' do
    context '#published?' do
      context 'when published_at persists' do
        let!(:post) { create(:post, :published) }

        it 'return true' do
          expect(post.published?).to be_truthy
        end
      end

      context 'when published_at does not persist' do
        let!(:post) { create(:post) }

        it 'return false' do
          expect(post.published?).to be_falsey
        end
      end
    end
  end
end
