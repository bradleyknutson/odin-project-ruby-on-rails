class Game
  @@colors = ["blue", "red", "green", "white", "red", "purple", "orange"]
  def initialize(num_of_colors)
    @secret_colors = [];
    generate_colors(num_of_colors)
  end

  private

  def generate_colors(num_of_colors)
    (1..num_of_colors).each do
      @secret_colors.push(@@colors[Random.new.rand(@@colors.length)])
    end
  end

  def check_matches(guess_arr)
    matched_arr = guess_arr.map.with_index do |guess, index|
      guess == @secret_colors[index] ? guess = "X" : guess
    end
    blanked_secret_colors = @secret_colors.map {}
  end

  public

  def guess(arr)
    # Check if it's equal
    return true if @secret_colors.eql?(arr)
    p @secret_colors
    matched = check_matches(arr)
    # Check each index for the correct ones
    # Check if each index is in the answer but in a different place

    # Must take into account duplicate colors.  If red is guessed twice and is in the answer once,
    # only one of the reds should show as in the answer.  
  end
end

a = ["red", "orange", "blue", "purple"]
guess = ['purple', 'orange', 'red', 'white']
response = ['O', 'X', 'O', '-']

a2 = ["purple", "orange", "purple", "orange"]
guess2 = ["orange", "white", "orange", "orange"]
response2 = ["O", "-", "-", "X"]
# Based on this, checking for correct guesses first and then finding
# ones that are elsewhere is needed.  Since there are 3 oranges in the guess,
# and the final one is correct, that one needs to be set to an X in order
# to correctly show that only one other orange exists elsewhere and the orange in 
# the third slot does not exist