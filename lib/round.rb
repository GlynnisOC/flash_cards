require './lib/turn'

class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def start
    puts "Welcome! You're playing with 4 cards."
    puts "-------------------------------------"
    puts "This is card number 1 out of 4."
    puts "What animal gives the best nose boops of them all?"
    guess = gets.chomp
    guess.capitalize!
    new_turn = take_turn(guess)
    puts new_turn.feedback
    puts "This is card number 2 out of 4."
    puts "Which Childish Gambino song won 'Song of the Year' at the Grammy's?"
    guess = gets.chomp
    guess.capitalize
    second_turn = take_turn(guess)
    puts second_turn.feedback
    puts "This is card number 3 out of 4."
    puts "Which animal is commonly referred to as 'the rat of the sky'?"
    guess = gets.chomp
    guess.capitalize!
    third_turn = take_turn(guess)
    puts third_turn.feedback
    puts "This is card number 4 out of 4."
    puts "How does James Bond like his margaritas?"
    guess = gets.chomp
    last_turn = take_turn(guess)
    puts last_turn.feedback
    puts "***** GAME OVER *****"
    puts "You had #{number_correct} correct guesses out of 4 for a total score of #{percent_correct}%"
    puts "Animal Facts - #{percent_correct_by_category(:Animal_facts)}% correct"
    puts "Music - #{percent_correct_by_category(:Music)}% correct"
    puts "Pop Culture - #{percent_correct_by_category(:Pop_culture)}% correct"
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
