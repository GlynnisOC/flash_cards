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

  # require 'pry'; binding.pry
  def number_correct_by_category(category)
    correct_by_cat = 0
    incorrect_by_cat = 0
    if @deck.cards_in_category(category)
      correct_by_cat += 1
    else
      incorrect_by_cat += 1
    end
    correct_by_cat
  end
end
