require "byebug"

class MaxIntSet
  attr_reader :store
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    if num > @store.length || num < 0
      raise "Out of bounds"
    else
      @store[num] = true
      true
    end
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  attr_reader :store
  def initialize(num_buckets = 20)
     @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    # index = num % @store.length
    self[num] << num if !include?(num) # unless @store[num].nil?
  end

  def remove(num)
    if include?(num)
      self[num].delete(num)
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    #optional but useful; return the bucket corresponding to `num`
    index = num % @store.length
    @store[index]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if !include?(num)
      self[num] << num
      @count += 1
    end 
    resize! if num_buckets < @count
  end

  def remove(num)
    if include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    index = num % @store.length
    @store[index]
  end

  def num_buckets
    @store.length
  end

  def resize!
      old_store = @store
      @count = 0
      @store = Array.new(num_buckets * 2) { Array.new }
      old_store.flatten.each do |ele|
        insert(ele)
      end
  end
end

