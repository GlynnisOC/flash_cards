class Deck
  attr_reader :cards

  def initialize()
    @cards = []
  end

  def cards
    card.find_all do |c|
      c.object_id
    end
    @cards << card.object_id
  end

  def cards_in_category(c)
    card.find_all do |c|
      c.slice
    end
  end

  def count
    card.count
  end
end
