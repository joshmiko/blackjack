require_relative "deck"
require_relative "hand"

deck = Deck.new

player_cards = []
player_cards << deck.deal
player_cards << deck.deal
player = Hand.new(player_cards)

computer_cards = []
computer_cards << deck.deal
computer_cards << deck.deal
computer = Hand.new(computer_cards)

# computer_cards_new = deck.deal(1)
# computer_new = Hand.new(computer_cards_new)
# computer_total = (computer.calculate_hand + computer_new.calculate_hand)


puts "Welcome to Blackjack!"
print "\nYour Hand is:"
player.display
puts "Player score: #{player.calculate_hand}"



while true
  puts"\nHit or stand (H/S): "
  input = gets.chomp.downcase
  if input == "h"
    player_card_new = deck.deal
    player.add_card(player_card_new)
    puts "\nPlayer was dealt #{player_card_new}"
    puts "\nPlayer score: #{player.calculate_hand}"
    if player.calculate_hand > 21
      puts "\nSorry bust! You Lose!"
      exit
    end
  elsif input == "s"
    puts "\nPlayer stands"
    puts "\nPlayer score: #{player.calculate_hand}"
    break
  else
    puts "Sorry, invalid input, please select h or s"
  end
end


computer.display
puts "Dealer score: #{computer.calculate_hand}"

while computer.calculate_hand <= 17

  computer_cards_new = deck.deal
  computer.add_card(computer_cards_new)
  puts "\nDealer was dealt #{computer_cards_new}"
end


if player.calculate_hand  > computer.calculate_hand
  puts "\nYou win!"
elsif computer.calculate_hand > 21
  puts "\nDealer busts, you win!"
elsif computer.calculate_hand > player.calculate_hand
  puts "\nDealer wins"
else
  puts "\nTie!"
end
