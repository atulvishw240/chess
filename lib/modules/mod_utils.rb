# Helper Methods
module Utils
  FILES = ["", "a", "b", "c", "d", "e", "f", "g", "h"].freeze

  def file_to_int(file)
    FILES.index(file)
  end

  def int_to_file(integer)
    FILES[integer]
  end

  def rank_to_row_index(rank)
    9 - rank
  end

  def sum(num1, num2)
    num1 + num2
  end

  def inline_space(number)
    spaces = ""
    number.times do
      spaces += " "
    end

    spaces
  end
end
