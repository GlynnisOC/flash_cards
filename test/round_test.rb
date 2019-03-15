require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/round'

class RoundTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @deck = Deck.new([@card_1, @card_2, @card_3])
    @round = Round.new(@deck)
  end

  def test_it_exists
    assert_instance_of Round, @round
  end

  def test_it_returns_the_deck
    assert_equal @deck, @round.deck
  end

  def test_it_starts_without_a_turn
    assert_equal [], @round.turns
  end

  def test_it_returns_the_current_card
    assert_equal @card_1, @round.current_card
  end

  def test_it_takes_a_turn
    new_turn = @round.take_turn("Juneau")
    assert_equal new_turn.class, Turn
    assert_equal new_turn.correct?, true
  end

  def test_it_adds_turns_to_turns_array
    new_turn = @round.take_turn("Juneau")
    assert_equal [new_turn], @round.turns
  end

  def test_it_shows_if_guess_was_correct
    new_turn = @round.take_turn("Juneau")
    another_turn = @round.take_turn("Jupiter")
    assert_equal 1, @round.number_correct
  end

  def test_deck_shuffles_to_next_card
    new_turn = @round.take_turn("Juneau")
    assert_equal @card_2, @round.current_card
  end

  def test_it_returns_correct_amount_turns_taken_feedback_and_how_many_correct
    new_turn = @round.take_turn("Juneau")
    next_turn = @round.take_turn("Venus")
    assert_equal 2, @round.turns.count
    assert_equal "Incorrect!", @round.turns.last.feedback
    assert_equal 1, @round.number_correct
  end

  def test_it_returns_number_correct_by_category
    new_turn = @round.take_turn("Juneau")
    next_turn = @round.take_turn("Venus")
    assert_equal 1, @round.number_correct_by_category(:Geography)
    assert_equal 0, @round.number_correct_by_category(:STEM)
  end
end
# require 'pry'; binding.pry


# pry(main)> round.percent_correct
# #=> 50.0
#
# pry(main)> round.percent_correct_by_category(:Geography)
# #=> 100.0
#
# pry(main)> round.current_card
# #=> #<Card:0x00007fa161a136f0 @answer="North north west", @question="Describe in words the exact direction that is 697.5° clockwise from due north?", @category=:STEM>
