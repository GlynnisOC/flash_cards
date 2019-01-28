require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test

  def test_it_exists
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    deck = Deck.new(cards)

    assert_instance_of Deck, deck
  end

  def test_how_many_cards_drawn
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    deck = Deck.new

    assert_equal 1, deck.count
  end

  def test_how_many_cards_in_category
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    deck = Deck.new

    assert_equal "Geography", deck.cards_in_category
  end
end
