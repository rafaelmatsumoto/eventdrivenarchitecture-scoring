# frozen_string_literal: true

require 'scoring'

describe Scoring do
  context 'when lead is approved' do
    it 'has annual_earnings greater than 3000' do
      lead = Scoring.score('annual_earnings' => 3001)
      expect(lead).to eq true
    end

    it 'has annual_earnings that equals 3000' do
      lead = Scoring.score('annual_earnings' => 3000)
      expect(lead).to eq true
    end
  end
  context 'when lead is not approved' do
    it 'returns true' do
      lead = Scoring.score('annual_earnings' => 2999)
      expect(lead).to eq false
    end
  end
end
