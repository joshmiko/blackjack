require_relative 'deck'
class Hand
  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def add_card(card)
    @cards << card
  end

  def display
    @cards.each do |card|
      print "#{card} "
    end
    puts 
  end


  def calculate_hand
    value = 0
    @cards.each do |card|
      if ['J', 'Q', 'K'].include?(card[0])
        value += 10
      elsif card.length > 2
        value += 10
      elsif ['A'].include?(card[0])
        if value <= 10 && ['A'].include?(card[0])
          value += 11
        else
          value += 1
        end
      else
        value += card[0].to_i
      end
    end
    value
  end


end
