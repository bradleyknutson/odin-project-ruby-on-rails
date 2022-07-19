When your Ruby program crashes after encountering a runtime error or exception, it will produce a wall of text known as a stack trace that is then output in your terminal. 

The debugging process is all about confirming assumptions about your code until you find something that goes against your assumptions. For example, does a variable or method return what you expect? Does a calculation or iteration over an array or hash give the output you expect?

The easiest and quickest way to confirm your assumptions while debugging is by using puts statements to output the return value of variables, methods, calculations, iterations, or even entire lines of code to your terminal.

Pry is a Ruby gem that provides you with an interactive REPL while your program is running. The REPL provided by Pry is very similar to IRB but has added functionality. The recommended Ruby gem for debugging is Pry-byebug and it includes Pry as a dependency. Pry-byebug adds step-by-step debugging and stack navigation.

To use Pry-byebug, you’ll first need to install it in your terminal by running gem install pry-byebug. You can then make it available in your program by requiring it at the top of your file with require 'pry-byebug'. Finally, to use Pry-byebug, you just need to call binding.pry at any point in your program.

Using the same example above, you can use one of pry-byebug’s commands to figure out what name = name.upcase will return. You won’t need to quit the session or add another binding.pry beneath it. Enter next to step over to the next line.

The program encounters an error and won’t run. For example, a typo may cause a syntax error to be raised that causes the program to crash. In this case, Ruby provides a stack trace.

The program runs but does not work the way you expect. For example, you expect a method to return a 2, but it actually returns 6 when you run it. In this case, there is no stack trace.

Obviously, if available, the stack trace is the first place you should look when debugging. If there’s no stack trace, then puts and Pry are the easiest and quickest tools you can use to get yourself back up and running.

If you want to completely quit a pry session you can type exit!, if you do a regular exit it runs your program until the next breakpoint.

The power of pry doesn't end here. For example, you can use the ls command to see what methods and instance variables an object has access to.

One of these tools is Wireshark, which will let you inspect network traffic.

If you are dealing with SSL-encrypted traffic a mitm (Man in the middle) proxy like mitmproxy might be able to help you.

You can also try curl to initiate HTTP connections from your terminal, which may help you debug invalid server responses.

Another tool that is useful to be familiar with is strace (linux only).

Strace will show you all the system calls that your app is doing.

You can filter for specific system calls using the -e option. A more modern alternative to strace is sysdig.

Finally, if you are dealing with an issue that looks like it's coming from some external gem, an obvious step is to inspect the gem's source code.

You can use the gem open command to open the source code on your configured editor.