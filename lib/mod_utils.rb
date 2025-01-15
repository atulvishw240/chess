# Helper Methods
module Utils
  FILES = ["", "a", "b", "c", "d", "e", "f", "g", "h"].freeze

  def file_to_int(file)
    FILES.index(file)
  end

  def int_to_file(integer)
    FILES[integer]
  end
end
