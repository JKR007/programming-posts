require 'rails_helper'

RSpec.describe History, type: :model do
  describe 'Associations' do
    it { should belong_to(:trackable) }
  end
end
