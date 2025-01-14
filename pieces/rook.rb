require_relative "piece"
# ROOK
class Rook < Piece
  def move
    
  end

  #----------------------------------------ALL PRIVATE METHODS ARE BELOW-------------------------------------------

  private

  def all_possible_positions
    positions = []
    file = self.file
    rank = self.rank

    vertical_positions = vertical_positions(rank)
  end

  def vertical_positions(rank)
    front_positions = forward(rank)
    back_positions = backward(rank)

    vertical_positions = front_positions.concat(back_positions)
  end

  def forward(rank)
    ranks = []
    until rank == 7
      rank += 1
      ranks << rank
    end

    ranks
  end

  def backward(rank)
    ranks = []
    until rank.zero?
      rank -= 1
      ranks << rank
    end

    ranks
  end
end
