require_relative "game"

game = Game.new(4)
p game.guess(["red", "red", "blue", "blue"])