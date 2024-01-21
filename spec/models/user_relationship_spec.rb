require 'rails_helper'

RSpec.describe UserRelationship, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:follower_id) }
    it { should validate_presence_of(:followee_id) }
  end

  describe 'Associations' do
    it { should belong_to(:follower).class_name('User') }
    it { should belong_to(:followee).class_name('User') }
  end
end
