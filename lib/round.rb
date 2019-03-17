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

  def number_correct_by_category(category)
    @turns.find_all do |turn|
      (turn.card.category == category) && (turn.guess == turn.card.answer)
    end.count
  end

  def percent_correct
    ((number_correct.to_f) / (@turns.count)) * 100
  end

  def percent_correct_by_category(category)
    number_correct_by_category(category) * 100
  end
end
# require 'pry'; binding.pry
