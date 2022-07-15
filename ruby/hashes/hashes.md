my_hash = {
  "a random word" => "ahoy",
  "Dorothy's math test score" => 94,
  "an array" => [1, 2, 3],
  "an empty hash within a hash" => {}
}
This example shows the most basic way to create a hash, which is to use the hash literal of curly braces ({}).

As you can see, the values of a hash can be a number, a string, an array, or even another hash. Keys and values are associated with a special operator called a hash rocket: =>.

Just like with an array, you can also create a new hash by calling the good old #new method on the Hash class.

my_hash = Hash.new
my_hash               #=> {}

You can access values in a hash the same way that you access elements in an array. When you call a hash’s value by key, the key goes inside a pair of brackets, just like when you’re calling an array by index.

shoes = {
  "summer" => "sandals",
  "winter" => "boots"
}

shoes["summer"]   #=> "sandals"

If you try to access a key that doesn’t exist in the hash, it will return nil:

shoes["hiking"]   #=> nil

Sometimes, this behavior can be problematic for you if silently returning a nil value could potentially wreak havoc in your program. Luckily, hashes have a fetch method that will raise an error when you try to access a key that is not in your hash.

shoes.fetch("hiking")   #=> KeyError: key not found: "hiking"

Alternatively, this method can return a default value instead of raising an error if the given key is not found.

shoes.fetch("hiking", "hiking boots") #=> "hiking boots"

You can add a key-value pair to a hash by calling the key and setting the value, just like you would with any other variable.

shoes["fall"] = "sneakers"

shoes     #=> {"summer"=>"sandals", "winter"=>"boots", "fall"=>"sneakers"}

You can also use this approach to change the value of an existing key.

shoes["summer"] = "flip-flops"
shoes     #=> {"summer"=>"flip-flops", "winter"=>"boots", "fall"=>"sneakers"}

Removing Data
Deleting data from a hash is simple with the hash’s #delete method, which provides the cool functionality of returning the value of the key-value pair that was deleted from the hash.

shoes.delete("summer")    #=> "flip-flops"
shoes                     #=> {"winter"=>"boots", "fall"=>"sneakers"}

Hashes respond to many of the same methods as arrays do since they both employ Ruby’s Enumerable module

A couple of useful methods that are specific to hashes are the #keys and #values methods, which very unsurprisingly return the keys and values of a hash, respectively. Note that both of these methods return arrays.

books = {
  "Infinite Jest" => "David Foster Wallace",
  "Into the Wild" => "Jon Krakauer"
}

books.keys      #=> ["Infinite Jest", "Into the Wild"]
books.values    #=> ["David Foster Wallace", "Jon Krakauer"]

Occasionally, you’ll come across a situation where two hashes wish to come together in holy union. Luckily, there’s a method for that. (No ordained minister required!)

hash1 = { "a" => 100, "b" => 200 }
hash2 = { "b" => 254, "c" => 300 }
hash1.merge(hash2)      #=> { "a" => 100, "b" => 254, "c" => 300 }
Notice that the values from the hash getting merged in (in this case, the values in hash2) overwrite the values of the hash getting… uh, merged at (hash1 here) when the two hashes have a key that’s the same.

 you’ll almost always see symbols (like :this_guy) used as keys. This is predominantly because symbols are far more performant than strings in Ruby, but they also allow for a much cleaner syntax when defining hashes. Behold the beauty:

# 'Rocket' syntax
american_cars = {
  :chevrolet => "Corvette",
  :ford => "Mustang",
  :dodge => "Ram"
}
# 'Symbols' syntax
japanese_cars = {
  honda: "Accord",
  toyota: "Corolla",
  nissan: "Altima"
}

When you use the cleaner ‘symbols’ syntax to create a hash, you’ll still need to use the standard symbol syntax when you’re trying to access a value. In other words, regardless of which of the above two syntax options you use when creating a hash, they both create symbol keys that are accessed the same way.

Because hashes can have multiple elements in them, there will be times when you'll want to iterate over a hash to do something with each element. Iterating over hashes is similar to iterating over arrays with some small differences. We'll use the each method

def greeting(name, options = {})
  if options.empty?
    puts "Hi, my name is #{name}"
  else
    puts "Hi, my name is #{name} and I'm #{options[:age]}" +
         " years old and I live in #{options[:city]}."
  end
end

greeting("Bob")
greeting("Bob", {age: 62, city: "New York City"})

Does this data need to be associated with a specific label? If yes, use a hash. If the data doesn't have a natural label, then typically an array will work fine.

Does order matter? If yes, then use an array. As of Ruby 1.9, hashes also maintain order, but usually ordered items are stored in an array.

Do I need a "stack" or a "queue" structure? Arrays are good at mimicking simple "first-in-first-out" queues, or "last-in-first-out" stacks.

key?
The key? method allows you to check if a hash contains a specific key. It returns a boolean value.

irb :001 > name_and_age = { "Bob" => 42, "Steve" => 31, "Joe" => 19}
=> {"Bob"=>42, "Steve"=>31, "Joe"=>19}
irb :002 > name_and_age.key?("Steve")
=> true
irb :003 > name_and_age.key?("Larry")
=> false

select
The select method allows you to pass a block and will return any key-value pairs that evaluate to true when passed to the block.

irb :004 > name_and_age.select { |k,v| k == "Bob" }
=> {"Bob"=>42}
irb :005 > name_and_age.select { |k,v| (k == "Bob") || (v == 19) }
=> {"Bob"=>42, "Joe"=>19}

fetch
The fetch method allows you to pass a given key and it will return the value for that key if it exists. You can also specify an option for return if that key is not present. Take a look at the Ruby docs here to see what else is possible.

irb :006 > name_and_age.fetch("Steve")
=> 31
irb :007 > name_and_age.fetch("Larry")
=> KeyError: key not found: "Larry"
     from (irb):32:in `fetch'
     from (irb):32
     from /usr/local/rvm/rubies/ruby-2.5.3/bin/irb:16:in `<main>'
irb :008 > name_and_age.fetch("Larry", "Larry isn't in this hash")
=> "Larry isn't in this hash"

to_a
The to_a method returns an array version of your hash when called. Let's see it in action. It doesn't modify the hash permanently though.

irb :009 > name_and_age.to_a
=> [["Bob", 42], ["Steve", 31], ["Joe", 19]]
irb :010 > name_and_age
=> {"Bob"=>42, "Steve"=>31, "Joe"=>19}

In past versions of Ruby, you could not rely on hashes maintaining order. Since Ruby 1.9, hashes maintain the order in which they're stored. It's important that you know this because if you are ever working with an older version of Ruby (anything before Ruby 1.9) you cannot rely on the hashes being in any specific order.

opposites = {positive: "negative", up: "down", right: "left"}

opposites.each_key { |key| puts key }
opposites.each_value { |value| puts value }
opposites.each { |key, value| puts "The opposite of #{key} is #{value}" }

# value?

if opposites.value?("negative")
  puts "Got it!"
else
  puts "Nope!"
end