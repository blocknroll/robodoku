require 'minitest/autorun'
require 'minitest/pride'
require './lib/robodoku'

class RobodokuTest < Minitest::Test

  def setup
    @robodoku = Robodoku.new
  end

  def test_it_exists
    assert @robodoku
  end

  def test_it_can_create_a_board
    puzzle = File.read("./lib/puzzle_row_1.txt").chomp
    assert_equal "12 456789", puzzle
  end

  def test_the_puzzle_is_a_string
    puzzle = File.read("./lib/puzzle_row_1.txt").chomp
    assert_equal '12 456789', puzzle.to_s
  end

  def test_it_turns_the_puzzle_string_into_an_array
    puzzle = File.read("./lib/puzzle_row_1.txt").chomp
    assert_equal ["1", "2", " ", "4", "5", "6", "7", "8", "9"], @robodoku.puzzle_to_array(puzzle)
  end

  def test_puzzle_array_has_9_elements
    puzzle_array = ["1", "2", " ", "4", "5", "6", "7", "8", "9"]
    assert_equal 9, puzzle_array.count
  end

  def test_it_can_convert_an_array_of_strings_to_integers
    puzzle_array = ["1", "2", " ", "4", "5", "6", "7", "8", "9"]
    assert_equal [1, 2, 0, 4, 5, 6, 7, 8, 9], @robodoku.array_to_integer(puzzle_array)
  end

  def test_it_can_access_possible_numbers
    assert_equal [1, 2, 3, 4, 5, 6, 7, 8, 9], @robodoku.possible_nums
  end

  def test_it_can_solve_one_row
    @robodoku.array_nums    = [1, 2, 0, 4, 5, 6, 7, 8, 9]
    @robodoku.possible_nums = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    assert_equal [3], @robodoku.solve_one_row
  end

end







  # def test_it_can_create_a_board
  #   robodoku = Robodoku.new
  #   board = robodoku.create_board
  #   assert_equal [[0, 1, 2, 3, 4, 5, 6, 7, 8 ],
  #                 [0, 1, 2, 3, 4, 5, 6, 7, 8 ],
  #                 [0, 1, 2, 3, 4, 5, 6, 7, 8 ],
  #                 [0, 1, 2, 3, 4, 5, 6, 7, 8 ],
  #                 [0, 1, 2, 3, 4, 5, 6, 7, 8 ],
  #                 [0, 1, 2, 3, 4, 5, 6, 7, 8 ],
  #                 [0, 1, 2, 3, 4, 5, 6, 7, 8 ],
  #                 [0, 1, 2, 3, 4, 5, 6, 7, 8 ],
  #                 [0, 1, 2, 3, 4, 5, 6, 7, 8 ]], robodoku.create_board
  # end
