require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

class TurnTest < Minitest::Test

  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
    @card_2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    @turn_2 = Turn.new("Saturn", @card_2)
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_it_returns_the_card
    assert_equal @card, @turn.card
  end

  def test_it_returns_the_guess
    assert_equal "Juneau", @turn.guess
  end

  def test_it_returns_if_guess_is_correct_or_not
    assert_equal true, @turn.correct?
    assert_equal false, @turn_2.correct?
  end

  def test_it_provides_feedback
    assert_equal "Correct!", @turn.feedback
  end

  def test_it_provides_incorrect_when_false
    assert_equal "Incorrect!", @turn_2.feedback
  end
end
