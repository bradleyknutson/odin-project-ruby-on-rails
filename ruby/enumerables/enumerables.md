friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.select { |friend| friend != 'Brian' }
 #=> ["Sharon", "Leo", "Leila", "Arun"]

friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.reject { |friend| friend == 'Brian' }
 #=> ["Sharon", "Leo", "Leila", "Arun"]

 #each is the granddaddy of the enumerable methods. It’s a bit like Chuck Norris: it can do anything. As you’ll see throughout this lesson, though, just because you can use #each to do just about anything doesn’t mean it’s always the best or most efficient tool for the job.

Calling #each on an array will iterate through that array and will yield each element to a code block, where a task can be performed:

friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.each { |friend| puts "Hello, " + friend }

#=> Hello, Sharon
#=> Hello, Leo
#=> Hello, Leila
#=> Hello, Brian
#=> Hello, Arun

#=> ["Sharon", "Leo", "Leila", "Brian" "Arun"]

Within the block, you’ll notice that we have |friend|, which is known as a block variable. This is the element from your array that the block is currently iterating over. You can use any variable name that you find helpful here; in this example, we could have used |x|, but |friend| is more descriptive of what each element is. In the first iteration, the value of |friend| will be 'Sharon'; in the second iteration, its value will be 'Leo'; in the third, 'Leila'; and so on until it reaches the end of the array.

What if the block you want to pass to a method requires more logic than can fit on one line? It starts to become less readable and looks unwieldy. For multi-line blocks, the commonly accepted best practice is to change up the syntax to use do...end instead of {...}:

my_hash = { "one" => 1, "two" => 2 }

my_hash.each { |key, value| puts "#{key} is #{value}" }

one is 1
two is 2
#=> { "one" => 1, "two" => 2}

my_hash.each { |pair| puts "the pair is #{pair}" }

the pair is ["one", 1]
the pair is ["two", 2]
#=> { "one" => 1, "two" => 2}

The each_with_index Method
This method is nearly the same as #each, but it provides some additional functionality by yielding two block variables instead of one as it iterates through an array

fruits = ["apple", "banana", "strawberry", "pineapple"]

fruits.each_with_index { |fruit, index| puts fruit if index.even? }

#=> apple
#=> strawberry
#=> ["apple", "banana", "strawberry", "pineapple"]

The #map method (also called #collect) transforms each element from an array according to whatever block you pass to it and returns the transformed elements in a new array. #map may seem confusing at first, but it is extremely useful. We’ll go through several examples and use cases, which should help you understand how and when you can use this enumerable power for good.

The #select method (also called #filter) passes every item in an array to a block and returns a new array with only the items for which the condition you set in the block evaluated to true.

The #reduce method (also called #inject) is possibly the most difficult-to-grasp enumerable for new coders. The idea is simple enough, though: it reduces an array or hash down to a single object. You should use #reduce when you want to get an output of a single value.

The first block variable in the #reduce enumerable (sum in this example) is known as the accumulator. The result of each iteration is stored in the accumulator and then passed to the next iteration. The accumulator is also the value that the #reduce method returns at the end of its work. By default, the initial value of the accumulator is the first element in the collection, so for each step of the iteration, we would have the following:

Earlier, we mentioned that enumerables like #map and #select return new arrays but don’t modify the arrays that they were called on. This is by design since we won’t often want to modify the original array or hash and we don’t want to accidentally lose that information. For example, if enumerables did mutate the original array, then using #select to filter out Brian from our invitation list would permanently remove him from our friends list. Whoah! That’s a bit drastic. Brian may be a nutcase at parties, but he’s still our friend.

As you’ll recall from the Methods lesson, bang methods can be easily identified by their exclamation marks (!) at the end of their name. All bang methods are destructive and modify the object they are called on. Many of the enumerable methods that return new versions of the array or hash they were called on have a bang method version available, such as #map! and #select!.

It’s best practice to avoid using these methods, however, as you or a future developer working on your code may need the original version. Remember that violent psychopath who you should expect will end up maintaining your code? Keep that in mind when making the decision to use bang methods.

