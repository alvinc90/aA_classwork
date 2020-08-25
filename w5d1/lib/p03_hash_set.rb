class HashSet
  # attr_reader :count
  attr_accessor :store, :count 
  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
      index = key.hash % num_buckets 
      unless self.include?(key) 
        self.store[index] << key 
        self.count +=1 
        if self.count > num_buckets
          resize!
        end
      end 
  end

  def include?(key)
      index = key.hash % num_buckets 
      self.store[index].include?(key) 
  end

  def remove(key)
     index = key.hash % num_buckets 
      if self.include?(key) 
        self.store[index].delete(key) 
        self.count -= 1
      end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
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
