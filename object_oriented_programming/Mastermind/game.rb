class Game
  @@colors = ["blue", "red", "green", "white", "red", "purple", "orange"]
  def initialize
    @secret_colors = [];
    (1..4).each do
      @secret_colors.push(@@colors[Random.new.rand(4)])
    end
    puts @secret_colors
  end
end