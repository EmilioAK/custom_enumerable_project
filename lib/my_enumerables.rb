module Enumerable
  # Your code goes here
  def my_each_with_index
    i = 0
    for e in self do
      yield(e, i)
      i += 1
    end
    self
  end

  def my_select
    matches = []
    for e in self do
      matches << e if yield(e)
    end
    matches
  end

  def my_all?
    for e in self do
      return false unless yield(e)
    end
    true
  end

  def my_any?
    for e in self do
      return true if yield(e)
    end
    false
  end

  def my_none?
    for e in self do
      return false if yield(e)
    end
    true
  end

  def my_count
    i = 0
    for e in self do
      if block_given?
        i += 1 if yield(e)
      else
        i += 1
      end
    end
    i
  end

  def my_map
    arr = []
    for e in self do
      arr << yield(e)
    end
    arr
  end

  def my_inject(inital)
    for e in self do
      inital = yield(inital, e)
    end
    inital
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for e in self do
      yield(e)
    end
    self
  end
end
