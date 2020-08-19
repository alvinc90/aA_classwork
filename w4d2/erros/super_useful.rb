# PHASE 2
def convert_to_int(str) 
  begin Integer(str)
  
    rescue ArgumentError  
    puts "Please try again with an integer"
    # retry
    # ensure

  end
end
# PHASE 3

class CoffeeError < StandardError
  def message
    puts "Please feed me apple, banana, or orange"
  end
end

class FruitError < StandardError 
  def message
    puts "Please feed me apple, banana, or orange"
  end
end

FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif  maybe_fruit == "coffee"
    raise CoffeeError
  else
    raise FruitError
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"
  begin 
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit) 
    rescue CoffeeError => e
      e.message 
      retry 
    rescue FruitError => e 
      e.message 
      retry 
  end
end  

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


