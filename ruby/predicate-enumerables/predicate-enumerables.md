You should recall from the Methods lesson that a predicate method is indicated by a question mark (?) at the end of the method name and returns either true or false. 

The #include? method works exactly like you think it should. If we want to know whether a particular element exists in an array, we can use the #include? method. This method will return true if the element you pass as an argument to #include? exists in the array or hash; otherwise, it will return false.

You might also be able to guess what the #any? method does. It returns true if any elements in your array or hash match the condition within the block; otherwise, it will return false.

The all? method is also fairly intuitive. It only returns true if all the elements in your array or hash match the condition you set within the block; otherwise, it will return false.

Special note to keep in mind while debugging: #all? will return true by default unless the block returns false or nil. So if you call #all? on an empty array or hash (i.e., there are no elements for the block to evaluate), it will return true.

As you might expect, #none? performs the opposite function of #all?. It returns true only if the condition in the block matches none of the elements in your array or hash; otherwise, it returns false.