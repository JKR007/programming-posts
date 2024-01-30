require 'rails_helper'

RSpec.describe History, type: :model do
  describe 'Associations' do
    it { should belong_to(:trackable) }
    it { should belong_to(:whodunit).with_foreign_key('user_id').class_name('User').optional }
  end
end
