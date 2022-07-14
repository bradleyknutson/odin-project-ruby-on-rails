methods have self-contained scope.

With blocks, the one rule that we want to emphasize is that: Inner scope can access variables initialized in an outer scope, but not vice versa.

Blocks are either `do...end` or `{ }`

Be aware that not all do...end pairs imply a block. We will explore this in much greater detail in later courses. In particular, a do...end on a for or while loop is not a block.

Put another way, the key distinguishing factor for deciding whether code delimited by {} or do/end is considered a block (and thereby creates a new scope for variables), is seeing if the {} or do/end immediately follows a method invocation. For example:

arr = [1, 2, 3]

for i in arr do
  a = 5      # a is initialized here
end

puts a       # is it accessible here?
The answer is yes. The reason is because the for...do/end code did not create a new inner scope, since for is part of Ruby language and not a method invocation. When we use each, times and other method invocations, followed by {} or do/end, that's when a new block is created.

Before we move on, you should be aware that there are five types of variables. Constants, global variables, class variables, instance variables, and local variables. While you should not worry too much about these topics in depth yet, here is a brief description of each.

Constants are declared by capitalizing every letter in the variable's name, per Ruby convention. They are used for storing data that never needs to change. While most programming languages do not allow you to change the value assigned to a constant, Ruby does. It will however throw a warning letting you know that there was a previous definition for that variable. Just because you can, doesn't mean you should change the value. In fact, you should not. Constants cannot be declared in method definitions, and are available throughout your application's scopes.

Example of a constant declaration:

MY_CONSTANT = 'I am available throughout your app.'

Global variables are declared by starting the variable name with the dollar sign ($). These variables are available throughout your entire app, overriding all scope boundaries. Rubyists tend to stay away from global variables as there can be unexpected complications when using them.

Example of a global variable declaration:

$var = 'I am also available throughout your app.'

Class variables are declared by starting the variable name with two @ signs. These variables are accessible by instances of your class, as well as the class itself. When you need to declare a variable that is related to a class, but each instance of that class does not need its own value for this variable, you use a class variable. Class variables must be initialized at the class level, outside of any method definitions. They can then be altered using class or instance method definitions.

Example of a class variable declaration:

@@instances = 0
Instance variables are declared by starting the variable name with one @ sign. These variables are available throughout the current instance of the parent class. Instance variables can cross some scope boundaries, but not all of them. You will learn more about this when you get to OOP topics, and should not use instance variables until you know more about them.

Example of an instance variable declaration:

@var = 'I am available throughout the current instance of this class.'
Local variables are the most common variables you will come across and obey all scope boundaries. These variables are declared by starting the variable name with neither $ nor @, as well as not capitalizing the entire variable name.

Example of a local variable declaration:

var = 'I must be passed around to cross scope boundaries.'

`a = "hi"`
`b = a`
`a << "hi there"`
`puts b #logs "hi there"`
This is due to the `<<` operator modifying the value for the same place in memory, as opposed to using an `=` which creates a new place in memory for the value.