require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'

# Use gets to read a line of text input from the user (this will be
# important to allow users to enter guesses)
card_1 = Card.new("What animal gives the best nose boops of them all?", "Foxes", :Animal_facts)
card_2 = Card.new("Which Childish Gambino song won 'Song of the Year' at the Grammy's?", "This is America", :Music)
card_3 = Card.new("Which animal is commonly referred to as 'the rat of the sky'?", "Pigeons", :Animal_facts)
card_4 = Card.new("How does James Bond like his margaritas?", "He doesn't", :Pop_culture)
cards = [card_1, card_2, card_3, card_4]
deck = Deck.new(cards)
round = Round.new(deck)
round.start
