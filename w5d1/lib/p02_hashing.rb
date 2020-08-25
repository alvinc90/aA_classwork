class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    # self = rand(0..9) 
    # self.map do |ele| 
    #   ele.to_i
    # end

    # self.t
  end
end

class String
  def hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end
