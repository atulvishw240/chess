# PLAYER
class Player
  attr_accessor :name, :color

  def initialize(name, color)
    @name = name
    @color = color
  end

  def select_piece
    puts "Enter coordinates of piece which you want to select (Ex: e4): "
    coordinates = gets.chomp.chars
    file = coordinates[0]
    rank = coordinates[1].to_i

    return coordinates if coordinates.length.equal?(2) && file.between?("a", "h") && rank.between?(1, 8)

    puts "\n"
    puts "Error, Try again!!"
    select_piece
  end
end
