class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)

    if !include?(key)
      self[key] << key
      @count += 1
    end 
    resize! if num_buckets < @count
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    if include?(key)
      self[key].delete(key)
      @count -= 1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    index = num.hash % @store.length
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



# class ResizingIntSet
#   attr_reader :count, :store

#   def initialize(num_buckets = 20)
#     @store = Array.new(num_buckets) { Array.new }
#     @count = 0
#   end

#   def insert(num)
#     if !include?(num)
#       self[num] << num
#       @count += 1
#     end 
#     resize! if num_buckets < @count
#   end

#   def remove(num)
#     if include?(num)
#       self[num].delete(num)
#       @count -= 1
#     end
#   end

#   def include?(num)
#     self[num].include?(num)
#   end

#   private

#   def [](num)
#     # optional but useful; return the bucket corresponding to `num`
#     index = num % @store.length
#     @store[index]
#   end

#   def num_buckets
#     @store.length
#   end

#   def resize!
#       old_store = @store
#       @count = 0
#       @store = Array.new(num_buckets * 2) { Array.new }
#       old_store.flatten.each do |ele|
#         insert(ele)
#       end
#   end

#   end
  