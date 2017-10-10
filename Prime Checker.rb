
def isPrime (numberToCheck)
    #variable to return whether or not the number is prime
    retval = true;

    #Number that will be squared
    testUpToNumber = 0;

    #Function that will continously square consecutive numbers until the product is greater than the number being checked
    while true
       testUpToNumber = testUpToNumber + 1
       if (testUpToNumber * testUpToNumber) >= numberToCheck
        break
       end
    end
    
    #Contiues to check if the number is evenly diveded
    for numbers in 2..testUpToNumber do
        if numberToCheck % numbers  == 0
            retval = false
            break
        end
    end

    #Three cases that are excluded from the previous test
    if numberToCheck == 0
        retval = false;
    end
    if numberToCheck == 1
        retval = false;
    end
    if numberToCheck == 2
        retval = true;
    end

    return retval

end

#Will find all consecutive primes between two given numbers
def consecutivePrimeNumbers (startingNumber, finishingNumber)

    startingPrime = 0
    consecutivePrime = 0

    #Starts looking through the list of numbers
    for num in startingNumber..finishingNumber do

        #Starting at the first given number, iterates through the list until the first prime is found
        for finder in startingNumber..finishingNumber do
            if isPrime(finder)
                startingPrime = finder
                break
            end
        end
        
        #Starting from the first found prime, iterates through the list unitl the next consecutive prime
        for secondFinder in startingPrime + 1..finishingNumber do
            if isPrime(secondFinder)
                consecutivePrime = secondFinder
                break
            end
        end    

        #If the consecutive prime is euqual or less than the starting number, we have finished our search
        if consecutivePrime <= startingPrime
            break
        end

        #Returns the block of the two consecutive primes
        yield(startingPrime,consecutivePrime)

        #restarts the loop starting at the second prime
        startingNumber = startingPrime + 1

    end

end

#Prints consecutive primes such as [prime1 prime2]
consecutivePrimeNumbers(1,20) do |prime1,prime2|
    print "[#{prime1} #{prime2}]"
end

puts

#returns an array of all of the primes (not in pairs)
arrayOfConsecutivePrimes = Array.new
members = 0
consecutivePrimeNumbers(1,20) do |prime1,prime2|
    if arrayOfConsecutivePrimes.include?(prime1) == false
        arrayOfConsecutivePrimes.push(prime1)
        print arrayOfConsecutivePrimes.at(members).to_s + " "
        members = members + 1
    end

    if arrayOfConsecutivePrimes.include?(prime2) == false
        arrayOfConsecutivePrimes.push(prime2)
        print arrayOfConsecutivePrimes.at(members).to_s + " "
        members = members +1
    end
end

puts 

#return an array of the differences between the consecutive primes
arrayOfDifference = Array.new
consecutivePrimeNumbers(1,20) do |prime1,prime2|
    differenceNumber = prime2 - prime1
    arrayOfDifference.push(differenceNumber)
end
#Prints array
arrayOfDifference.each do |i|
    print i.to_s + " "
end

puts

#return an array of the values directly in the middle of the primes
arrayOfTheMiddle = Array.new
consecutivePrimeNumbers(1,20) do |prime1,prime2|
    #Adds the primes together and divides them by 2 to find the number in between them
   total = prime1 + prime2
   dividedNumber = total / 2.0
    arrayOfTheMiddle.push(dividedNumber)
end
#Prints array
arrayOfTheMiddle.each do |i|
    print i.to_s + " "
end

puts

#finds the average difference between consecutive primes
#Gets array of differences
arrayOfDifferences = Array.new
consecutivePrimeNumbers(1,20) do |prime1,prime2|
    differenceNumber = prime2 - prime1
    arrayOfDifferences.push(differenceNumber)
end
#iterates through the array and adds the differences
differenceTotal = 0
arrayOfDifferences.each do |i|
    differenceTotal = differenceTotal + i
end
#finds average
averageDifference = differenceTotal.to_f / arrayOfDifference.length

puts "Average difference: " + averageDifference.to_s

#finds the minimum and maximum difference between consecutive primes in a range
#Gets the array of differences again
arrayOfDifferencez = Array.new
consecutivePrimeNumbers(1,20) do |prime1,prime2|
    differenceNumber = prime2 - prime1
    arrayOfDifferencez.push(differenceNumber)
end

#Sets variables for the max and min
minimumNumber = arrayOfDifferencez.at(0)
maximumNumber = arrayOfDifferencez.at(0)

#If i is less than min i becomes min, if i is greater than max i becomes max
arrayOfDifferencez.each do |i|
    if minimumNumber > i
        minimumNumber = i
    end
    if maximumNumber < i
        maximumNumber = i
    end
end

#Prints the min and max
puts "Minimum difference: " + minimumNumber.to_s 

puts "Maximum difference: " + maximumNumber.to_s