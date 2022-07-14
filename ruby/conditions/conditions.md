The only false values in ruby are `nil` and `false`.  Everything else is true.

```
if statement_to_be_evaluated == true

end
```
```
if 1 < 2
  puts "1 is less than 2, eh?"
end
```

`puts "1 is less than 2, eh?" if 1 < 2`

if attack_by_land == true
  puts "release the goat"
else
  puts "release the shark"
end

if attack_by_land == true
  puts "release the goat"
elsif attack_by_sea == true
  puts "release the shark"
else
  puts "release Kevin the octopus"
end

You can have as many elsif statements as you want.

`==` returns true if the values compared are equal
`!=` returns true if the values are not equal
`>` returns true if the left is greater than the right
`<` returns true if the left is lower than the right
`>=` greater than or equal
`<=` less than or equal
`#eql?` checks both the value type and actual value
  `5.eql?(5.0)` #=> false, since one is an integer and the other a float
  `5.eql?(5)` #=> true
`equal?` checks whether both values are the exact same object in memory.
  `a = "hello"`
  `b = "hello"`
  `a.equal?(b)` #=> false

Ruby has a special operator known as the spaceship operator.  It returns one of three numerical values instead of true/false.
`<=>` returns:
  -1 if the value on the left is greater than the one on the right
  0 if the value is equal
  1 if the value on the left is greater than the value on the right
The spaceship operator is normally used in sorting functions.

`&&` (and) `||` (or) and `!` (not) are logical operators that can be used as well. `and` and `or` work a bit differently but also can be used.

`&&` returns true if both sides are true
if 1 < 2 && 5 < 6
  puts "yay"
end

this can also be written as

if 1 < 2 and 5 < 6
  puts "yay"
end

With the || operator, if the first expression evaluates to true, then the second expression is never checked because the complete expression is already true, and the code in the block is run.

This is known as short circuit evaluation.

The ! operator reverses the logic of the expression. Therefore, if the expression itself returns false, using the ! operator makes the expression true, and the code inside the block will be executed.

if !false     #=> true
if !(10 < 5)  #=> true

Case statements are a neat way of writing several conditional expressions that would normally result in a messy if...elsif statement. You can even assign the return value from a case statement to a variable for use later.

```
grade = 'F'

did_i_pass = case grade #=> create a variable `did_i_pass` and assign the result of a call to case with the variable grade passed in
  when 'A' then "Hell yeah!"
  when 'D' then "Don't tell your mother."
  else "'YOU SHALL NOT PASS!' -Gandalf"
end
```
```
grade = 'F'

case grade
when 'A'
  puts "You're a genius"
  future_bank_account_balance = 5_000_000
when 'D'
  puts "Better luck next time"
  can_i_retire_soon = false
else
  puts "'YOU SHALL NOT PASS!' -Gandalf"
  fml = true
end
```

An unless statement works in the opposite way as an if statement: it only processes the code in the block if the expression evaluates to false. There isn’t much more to it.
age = 19
unless age < 18
  puts "Get a job."
end

age = 19
puts "Welcome to a life of debt." unless age < 18

unless age < 18
  puts "Down with that sort of thing."
else
  puts "Careful now!"
end

The ternary operator is a one-line if...else statement that can make your code much more concise.

Its syntax is conditional statement ? <execute if true> : <execute if false>. You can assign the return value of the expression to a variable.

age = 19
response = age < 18 ? "You still have your entire life ahead of you." : "You're all grown up."
puts response #=> "You're all grown up."