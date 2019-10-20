# frozen_string_literal: true

class Scoring
  @minimum_earnings = 3000

  def self.score(lead)
    lead['annual_earnings'] >= @minimum_earnings
  end
end
