If you’re wondering about all of the pound signs (#), they’re just the convention for writing out Ruby instance methods. We can use them to write out the full name of an instance method, e.g., Integer#upto, or just the method name, e.g., #upto, depending on the context. Note that in the development world, you shouldn’t call these “hashtags”. If you want to be super awesome, though, you can call them “octothorpes”. That word is totally trending.

Methods are typically called by adding .method_name after an instance of the object that contains that method.

"anything".reverse

It’s worth noting that in most languages, arguments are passed to methods by wrapping them in parentheses (). In Ruby, however, the parentheses are generally optional. We could rewrite the above code as puts("anything"), which Ruby would interpret in the same way.

You can create your own custom methods in Ruby using the following syntax:

def my_name
  "Joe Smith"
end

puts my_name    #=> "Joe Smith"

def is a built-in keyword that tells Ruby that this is the start of a method definition.
my_name is the name of your new method. You can name your methods almost anything you want, but there are some constraints and conventions, which are described in the next section.
"Joe Smith" is the code inside the method body. All of the logic for your method is contained in the indented lines of the method body. This particular method returns a string when the method is called.
end is a built-in keyword that tells Ruby that this is the end of the method definition.
To call the method, you simply need to use its name, as shown in the last line of the example.

You cannot name your method one of Ruby’s approximately 40 reserved words, such as end, while, or for. Checkout the full list here.
You cannot use any symbols other than _, ?, !, and =.
You cannot use ?, !, or = anywhere other than at the end of the name.
You cannot begin a method name with a number.

Of course, not all methods are as simplistic as the my_name example method above. After all, what good are methods if you can’t interact with them? When you want to return something other than a fixed result, you need to give your methods parameters. Parameters are variables that your method will receive when it is called. You can have more meaningful and useful interactions with your methods by using parameters to make them more versatile.

def greet(name)
  "Hello, " + name + "!"
end

puts greet("John") #=> Hello, John!

What if you don’t always want to provide arguments for each parameter that your method accepts? That’s where default parameters can be useful. Going back to our simple example above, what happens if we don’t know the person’s name? We can change our greet method to use a default name of “stranger”:

def greet(name = "stranger")
  "Hello, " + name + "!"
end

puts greet("Jane") #=> Hello, Jane!
puts greet #=> Hello, stranger!

Ruby is one of the few languages that offers implicit return for methods, which means that a Ruby method will return the last expression that was evaluated even without the return keyword. The last expression that was evaluated may or may not be the last line in the code, as you can see in the following example:

def even_odd(number)
  if number % 2 == 0
    "That is an even number."
  else
    "That is an odd number."
  end
end

puts even_odd(16) #=>  That is an even number.
puts even_odd(17) #=>  That is an odd number.

One of the magical properties of methods that allows you to write very concise code is being able to chain methods together. This can be done using Ruby’s built-in methods or with methods that you create.

phrase = ["be", "to", "not", "or", "be", "to"]

puts phrase.reverse.join(" ").capitalize
#=> "To be or not to be"

You will sometimes encounter built-in Ruby methods that have a question mark (?) at the end of their name, such as even?, odd?, or between?. These are all predicate methods, which is a naming convention that Ruby uses for methods that return a Boolean, that is, they return either true or false.

puts 5.even?  #=> false
puts 6.even?  #=> true
puts 17.odd?  #=> true

puts 12.between?(10, 15)  #=> true
You can also create your own method with a ? at the end of its name to indicate that it returns a Boolean. Ruby doesn’t enforce this naming convention, but you will thank yourself later for following this guideline.

When we call a method on an object, such as our whisper string above, it does not modify the original value of that object. A general rule in programming is that you do not want your methods to overwrite the objects that you call them on. This protects you from irreversibly overwriting your data by accident. You are able to overwrite your data by explicitly re-assigning a variable (such as whisper = whisper.downcase). Another way to do this type of reassignment is with bang methods, which are denoted with an exclamation mark (!) at the end of the method name.

By adding a ! to the end of your method, you indicate that this method performs its action and simultaneously overwrites the value of the original object with the result.

puts whisper.downcase! #=> "hello everybody"
puts whisper #=> "hello everybody"
Writing whisper.downcase! is the equivalent of writing whisper = whisper.downcase.

One important aspect of methods that all programmers need to understand is the concept of the call stack, or more casually, the stack.

The call stack helps Ruby keep track of what method is executing as well as where execution should resume when it returns. To do that, it works like a stack of books: if you have a stack of books, you can put a new book on the top or remove the topmost book from the stack. In much the same way, the call stack puts information about the current method on the top of the stack, then removes that information when the method returns.

In Ruby, methods aren't the only thing that uses the call stack. Blocks, procs, and lambdas also use the call stack; in fact, they all use the same call stack as Ruby uses for methods. For simplicity, we will usually just mention methods when discussing the call stack. However, you should always remember that blocks, procs, and lambdas are also part of this process.

