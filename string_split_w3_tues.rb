require 'minitest/autorun'
require 'minitest/pride'

# Write two methods:
#
#   * `first_name`: given a name in string, return the first name.
#   * `last_name`: given a name in string, return the last name.

# WRITE YOUR CODE HERE.
#one way
# def first_name(string)
#   arrayed = string.split
#   if arrayed.length > 2
#     return arrayed[0..-2].join(" ")
#   elsif arrayed.length == 2 || arrayed.length == 1
#     return arrayed[0]
#   else
#     return ""
#   end
# end
#
# def last_name(string)
#   arrayed = string.split
#   if arrayed.length >= 2
#     return arrayed[-1]
#   else
#     return ""
#   end
# end

#another way
# def first_name(name)
#   arrayed = name.split
#   arrayed.length > 1 ? arrayed[0..-2].join(" ") : arrayed.join("")
# end
#
# def last_name(name)
#   arrayed = name.split
#   arrayed.length > 1 ? arrayed[-1] : ""
# end

#a third way
def first_name(name)
  array = name.to_s.split
  return name.to_s if array.length < 2
  array[0..-2].join(" ")
end

def last_name(name)
  array = name.to_s.split
  return "" if array.length < 2
  array[-1]
end


class StringSplitChallenge < MiniTest::Test
  def test_first_name
    assert_equal "Mason", first_name("Mason Matthews")
  end

  def test_last_name
    assert_equal "Matthews", last_name("Mason Matthews")
  end

  def test_one_word_name
    assert_equal "deadmou5", first_name("deadmou5")
    assert_equal "", last_name("deadmou5")
  end

  def test_three_word_name
    assert_equal "John Quincy", first_name("John Quincy Adams")
    assert_equal "Adams", last_name("John Quincy Adams")
  end

  def test_no_word_name
    assert_equal "", first_name("")
    assert_equal "", last_name("")
  end
end
