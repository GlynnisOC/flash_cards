require './lib/turn'

class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards.shift
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    new_turn
  end
  # require 'pry'; binding.pry
  def number_correct
    correct = 0
    incorrect = 0
    @turns.each do |turn|
      if turn.correct?
        correct += 1
      else
        incorrect += 1
      end
    end
    correct
  end

end
