require_relative "piece"
# ROOK
class Rook < Piece
  include Utils

  def move
    
  end

  #----------------------------------------ALL PRIVATE METHODS ARE BELOW-------------------------------------------

  private

  def all_possible_moves
    positions = []
    file = self.file
    rank = self.rank

    vertical_positions = vertical_moves(rank, file)
  end

  def vertical_moves(rank, file)
    forward = front_moves(rank, file)
    backward = back_moves(rank, file)
    possible_moves = forward.concat(backward)
  end

  def front_moves(rank, file)
    ranks = []
    until rank == 7
      rank += 1
      ranks << rank
    end

    possible_moves_from_ranks(ranks, file)
  end

  def back_moves(rank, file)
    ranks = []
    until rank.zero?
      rank -= 1
      ranks << rank
    end

    possible_moves_from_ranks(ranks, file)
  end

  # Input - Ranks: [1, 2, 3]; file: c
  # Output - [[c, 1], [c, 2], [c, 3]]
  def possible_moves_from_ranks(possible_ranks, file)
    moves = []

    possible_ranks.map do |possible_rank|
      moves << [file, possible_rank]
    end
  end
end
