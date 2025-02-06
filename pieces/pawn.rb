require_relative "../lib/piece"
require_relative "../lib/modules/mod_colorable"
# PAWN
class Pawn < Piece
  include Colorable

  attr_accessor :start

  def initialize(color)
    @unicode = "\u{265F}"
    super
  end
end
