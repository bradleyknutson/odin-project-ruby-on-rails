# To convert an integer to a float:
13.to_f   #=> 13.0

# To convert a float to an integer:
<!-- No rounding is done -->
13.0.to_i #=> 13
13.9.to_i #=> 13

# #even?
6.even? #=> true
7.even? #=> false

# #odd?
6.odd? #=> false
7.odd? #=> true

Single quotation marks are string literals, only double quotes allow for string interpolation or escape characters.

# String Concatenation
## With the plus operator:
"Welcome " + "to " + "Odin!"    #=> "Welcome to Odin!"

## With the shovel operator:
"Welcome " << "to " << "Odin!"  #=> "Welcome to Odin!"

## With the concat method:
"Welcome ".concat("to ").concat("Odin!")  #=> "Welcome to Odin!"

# Substrings
"hello"[0]      #=> "h"
"hello"[0..1]   #=> "he"
"hello"[0, 4]   #=> "hell"
"hello"[-1]     #=> "o"

# Escape Characters
\\  #=> Need a backslash in your string?
\b  #=> Backspace
\r  #=> Carriage return, for those of you that love typewriters
\n  #=> Newline. You'll likely use this one the most.
\s  #=> Space
\t  #=> Tab
\"  #=> Double quotation mark
\'  #=> Single quotation mark

# String Interpolation
name = "Odin"

puts "Hello, #{name}" #=> "Hello, Odin"
<!-- Only works with double quotes -->
puts 'Hello, #{name}' #=> "Hello, #{name}"

# String Methods
"hello".capitalize #=> "Hello"

"hello".include?("lo")  #=> true
"hello".include?("z")   #=> false

"hello".upcase  #=> "HELLO"

"Hello".downcase  #=> "hello"

"hello".empty?  #=> false
"".empty?       #=> true

"hello".length  #=> 5

"hello".reverse  #=> "olleh"

"hello world".split  #=> ["hello", "world"]
"hello".split("")    #=> ["h", "e", "l", "l", "o"]

" hello, world   ".strip  #=> "hello, world"

"he77o".sub("7", "l")           #=> "hel7o"
"he77o".gsub("7", "l")          #=> "hello"
"hello".insert(-1, " dude")     #=> "hello dude"
"hello world".delete("l")       #=> "heo word"
"!".prepend("hello, ", "world") #=> "hello, world!"

# Converting to a string
5.to_s        #=> "5"
nil.to_s      #=> ""
:symbol.to_s  #=> "symbol"

# Symbols
"string" == "string"  #=> true
"string".object_id == "string".object_id  #=> false
:symbol.object_id == :symbol.object_id    #=> true

# Modulo vs .remainder and .divmod
Modulo operations return a positive integer when the second operand is positive, and a negative integer when the second operand is negative.

Remainder operations return a positive integer when the first operand is positive, and a negative integer when the first operand is negative.

Divmod computes the integer result as well as its modulo value

# =>
It's apparently called a Hash Rocket.  That's pretty awesome.  I'm still going to blame JS for me calling them arrows all this time.

# Other stuff
2 + 7
is the same as
2.+ 7

