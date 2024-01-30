require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe 'format_date' do
    let!(:date) { Date.new(2024, 1, 31) }

    it 'returns date in < Month day, Yea > format' do
      expect(format_date(date)).to eq('January 31, 2024')
    end
  end
end
