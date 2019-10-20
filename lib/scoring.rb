# frozen_string_literal: true

require 'colorize'

class Scoring
  def self.score(lead)
    if lead['annual_earnings'] > 3000
      puts "#{lead['name']} teve o crédito aprovado".green
    else
      puts "#{lead['name']} teve o crédito reprovado".red
    end
  end
end
