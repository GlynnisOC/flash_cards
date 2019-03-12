require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @deck = Deck.new(@cards)
  end

  def test_it_exists
    assert_instance_of Deck, @deck
  end

  def test_it_starts_without_any_cards
    assert_equal [], @deck.cards
  end

  def test_it_adds_cards_to_deck
    @deck.add_card(@card_1)
    @deck.add_card(@card_2)
    @deck.add_card(@card_3)
    assert_equal [@card_1, @card_2, @card_3], @deck.cards
  end

  def test_it_returns_total_amount_of_cards
    @deck.add_card(@card_1)
    @deck.add_card(@card_2)
    @deck.add_card(@card_3)
    assert_equal 3, @deck.count
  end

  def test_it_returns_the_card_by_category
    @deck.add_card(@card_1)
    @deck.add_card(@card_2)
    @deck.add_card(@card_3)
    assert_equal [@card_2, @card_3], @deck.cards_in_category(:STEM)
    assert_equal [@card_1], @deck.cards_in_category(:Geography)
    assert_equal [], @deck.cards_in_category("Pop Culture")
  end
end
