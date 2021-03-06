require 'pry'

class Robodoku

  attr_accessor :possible_nums, :array_nums, :array_nums_cleaned

  def initialize
    puzzle = File.read("./lib/puzzle_row_1.txt").chomp
    @possible_nums = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def puzzle_to_array(puzzle)
    puzzle.chars
  end

  def array_to_integer(puzzle)
    @array_nums = puzzle.map { |i| i.to_i }
  end

  def solve_one_row
    @possible_nums - @array_nums
  end

end
