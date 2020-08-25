class MaxIntSet
  attr_accessor :store
  def initialize(max)
    @store = Array.new(max, false) 
  end

  def insert(num)
      # if num > @store.length 
      #   raise "Out of bounds" 
      # else
      #   @store[num] = true 
      # end
      validate!(num)
      self.store[num] = true 
  end

  def remove(num)
      self.store[num] = false  if self.include?(num) 
  end

  def include?(num)
    # if @store[num] 
    validate!(num) 
    return true if self.store[num]
  end

  private

  def is_valid?(num)
      num <= @store.length and num > 0 
  end

  def validate!(num)
      raise "Out of bounds" unless is_valid?(num) 
  end
end


class IntSet
  attr_accessor :store 
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self.include?(num)
    index = num % num_buckets 
    self.store[index] << num 
  end

  def remove(num)
      self.include?(num) 
      index = num % num_buckets 
      self.store[index].delete(num) 
  end

  def include?(num)
      index = num % num_buckets 
      self.store[index].include?(num) 
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  # attr_reader :count
  attr_accessor :store, :count 
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
      index = num % num_buckets 
      unless self.include?(num) 
        self.store[index] << num 
        self.count +=1 
        if self.count > num_buckets
          resize!
        end
      end 
      
  end

  def remove(num)
      index = num % num_buckets 
      if self.include?(num) 
        self.store[index].delete(num) 
        self.count -= 1
      end
  end

  def include?(num)
      index = num % num_buckets 
      self.store[index].include?(num) 
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
      # index = num % num_buckets 
      # self.store.all? do |bucket| 
      #   bucket.length > 1
      # end
      self.count = 0 
      dupe_store = @store.dup 
        @store = Array.new(2 * num_buckets) {Array.new} 
          dupe_store.each do |bucket| 
            bucket.each do |ele| 
              # @store.insert(ele)
              self.insert(ele) 
              # insert(ele) 
            end
          # end
      end
      @store 
  end
end
