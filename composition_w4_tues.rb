require 'minitest/autorun'
require 'minitest/pride'

# Write a class which wraps around an array, but only allows odd numbers
# to be stored in the array.

# WRITE YOUR CODE HERE.
#one way
# class OddArray
#   def initialize(array)
#     @odds = []
#     array.each do |x|
#       if x % 2 != 0
#         @odds << x
#       end
#     end
#   end
#
#   def to_a
#     @odds
#   end
#
#   def add(number)
#     if number % 2 != 0
#       @odds << number
#     end
#   end
# end

#refactor
class OddArray
  def initialize(array)
    @odds = array.select {|n| n.odd?}
  end

  def to_a
    @odds
  end

  def add(number)
    @odds << number if number.odd?
  end
end

class CompositionChallenge < MiniTest::Test

  def test_class_exists
    assert OddArray
    refute OddArray.superclass == Array
  end

  def test_initializer_takes_array_parameter
    assert OddArray.new([1, 3, 5])
  end

  def test_to_a
    odd_array = OddArray.new([1, 3, 5])
    assert_equal [1, 3, 5], odd_array.to_a
  end

  def test_add_number
    odd_array = OddArray.new([1, 3, 5])
    odd_array.add(7)
    assert_equal [1, 3, 5, 7], odd_array.to_a
  end

  def test_initialize_with_evens
    odd_array = OddArray.new([1, 2, 3, 4, 5])
    assert_equal [1, 3, 5], odd_array.to_a
  end

  def test_add_evens
    odd_array = OddArray.new([1, 3, 5])
    odd_array.add(2)
    assert_equal [1, 3, 5], odd_array.to_a
  end

  def test_add_negatives
    odd_array = OddArray.new([-1, -2, 3, 4, -5])
    odd_array.add(-4)
    assert_equal [-1, 3, -5], odd_array.to_a
  end

end
