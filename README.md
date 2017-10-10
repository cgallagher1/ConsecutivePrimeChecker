# ConsecutivePrimeChecker
This code analyzes consecutive prime numbers. Written is a function that will generate consecutive prime numbers within a range of values and yields pairs to a block of code. This function allows some code to be sent in that examines each set of consecutive primes.
 
Then uses the function by passing in a block of code to: 
- print all consecutive primes in pairs like this [2 3][3 5][5 7]...
- return an array of all of the primes (not in pairs)
- return an array of the differences between the consecutive primes
- return an array of the values directly in the middle of the primes (the primes will be integers but these middle values can be floats)
- find the average difference between consecutive primes
- find the minimum and maximum difference between consecutive primes in a range
 
The consecutive prime function take explicit parameters for a starting value and an ending value to search for primes in. It should also implicitly take a block of code to execute on the consecutive primes.
 
The function does NOT create an array of primes. It generates prime pairs as they are needed and they are discarded after the closure is done with them. In other words, if I wanted to process the first 100 million prime pairs I should not need to store all of them in memory at any one point in time. This would be very memory inefficient. At most I need memory only for two primes at a time. This is one argument for using closures in a programming language.
