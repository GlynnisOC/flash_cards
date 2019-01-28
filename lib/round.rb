class Round
attr_reader :deck

  def initialize(deck)
    @deck = deck
  end

  def take_turn
    turn.guess
  end 
end
