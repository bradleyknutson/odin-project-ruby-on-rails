require_relative "game"

game = Game.new(4)
p game.guess(["red", "orange", "blue", "purple"])