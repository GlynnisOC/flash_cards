class Turn
  # what is within the parentheses is feeding the @value
  # @value can be named whatever, as long as the = value
  # matches the value within the parentheses
attr_reader :guess, :card, :category

  def initialize(guess, card, category)
    @guess = guess
    @card = card
    @category = category
  end

  def correct?
    @guess == Card.answer
    #no idea why when test runs it fails for no method for
    #answer for the Card class esp. since the test file
    #requires the card file 
  end
# feedback is calling on the correct?
# method defined above and will return
# answer w/o puts
  def feedback
    if correct?
     "Correct!"
   else
     "Incorrect."
    end
  end
end
