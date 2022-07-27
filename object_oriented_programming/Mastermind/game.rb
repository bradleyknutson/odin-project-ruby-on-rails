class Game
  @@colors = ["blue", "red", "green", "white", "red", "purple"]

  def initialize(num_of_colors)
    @secret_colors = [];
    @turn = 0
    generate_colors(num_of_colors)
  end

  private

  def generate_colors(num_of_colors)
    (1..num_of_colors).each do
      @secret_colors.push(@@colors[Random.new.rand(@@colors.length)])
    end
  end

  def check_matches(guess_arr)
    # It technically works...  Will make it better
    response = Array.new(4) { '-' }
    new_secret_colors = @secret_colors.map(&:clone)
    new_guess_arr = guess_arr.map(&:clone)

    new_secret_colors.each_with_index do |color, i|
      if color == new_guess_arr[i]
        new_secret_colors[i] = 'X'
        new_guess_arr[i] = 'X'
        response[i] = 'X'
      end
    end

    new_secret_colors.each_with_index do |color, i|
      next if color == "X" || color == 'O'

      if new_guess_arr.include?(color)
        new_guess_arr[new_guess_arr.find_index(color)] = 'O'
        new_secret_colors[i] = 'O'
        response[i] = 'O'
      end
    end
    
    response.sort.reverse

  end

  public

  def play
    puts 'Please enter 4 colors to guess'
    player_guess = [gets.chomp, gets.chomp, gets.chomp, gets.chomp]
    @turn += 1
    guess(player_guess)
  end

  def guess(arr)
    p @turn
    # Check if it's equal
    return true if @secret_colors.eql?(arr)

    p check_matches(arr)
    play
  end
end

# a = ["red", "orange", "blue", "purple"]
# guess = ['purple', 'orange', 'red', 'white']
# response = ['O', 'X', 'O', '-']

# a2 = ["purple", "orange", "purple", "orange"]
# guess2 = ["orange", "white", "orange", "orange"]
# response2 = ["O", "-", "-", "X"]
# Based on this, checking for correct guesses first and then finding
# ones that are elsewhere is needed.  Since there are 3 oranges in the guess,
# and the final one is correct, that one needs to be set to an X in order
# to correctly show that only one other orange exists elsewhere and the orange in 
# the third slot does not exist

# NEW UNDERSTANDING OF THE GAME
# The order of the response does not matter, only showing the number of items that were correct
# or otherwise in the solution elsewhere.  The number of correct guesses first, then "close" matches
# second.
# a = ["red", "green", "blue", "purple"]
# guess = ['purple', 'green', 'red', 'white']
# response = ['X', 'O', 'O', '-']

# a2 = ["purple", "orange", "purple", "orange"]
# guess2 = ["orange", "white", "orange", "orange"]
# response2 = ['X', 'O', '-', '-']
