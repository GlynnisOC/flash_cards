require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

class TurnTest < Minitest::Test

  def test_it_exists
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("What is the capital of Alaska?", "Juneau", :Geography)

    assert_instance_of Turn, turn
  end

  def test_it_has_a_guess
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("What is the capital of Alaska?", "Juneau", :Geography)

    assert_equal "What is the capital of Alaska?", turn.guess
  end

  def test_it_shows_a_card
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("What is the capital of Alaska?", "Juneau", :Geography)

    assert_equal "Juneau", turn.card
  end

  def test_is_guess_correct
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("What is the capital of Alaska?", "Juneau", :Geography)

    assert_equal "Juneau", turn.correct?
  end

  def test_letting_you_know_if_correct_or_not
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("What is the capital of Alaska?", "Juneau", :Geography)

    assert_equal "Incorrect", turn.feedback
  end
end
