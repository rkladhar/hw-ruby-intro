# When done, submit this entire file to the autograder.

# Part 1

def sum arr
  #Initialize the sum of array variable to 0, this variable will store the 
  #final value of the array
  sum_of_arr = 0
  #Iterate the array only if the length is greater than 0 
  if(arr.length > 0) then
    for i in 0..arr.length-1 do
      #Sum each element of the array
      sum_of_arr = sum_of_arr + arr[i]
    end
    return sum_of_arr
  else
    #Return 0 if the array is empty
    return 0
  end
end

def max_2_sum arr
  #Get the sum of the largest two numbers if the array has more than 1 elements
  if(arr.length > 1) then
    
    #Let's suppose the first largest number is the first element in the array
    #We will now compare this element to all other elements in the array
    #to check and see if there is another element in the array greater than 
    #"max_first", otherwise "max_first" will be the largest element in the array
    max_first = arr[0]
    #Saving the value of the index of the largest element in the array, which
    #will be used later
    element_index = 0
    for i in 0..arr.length-1 do
      #Compare the first element of the array with the remaining elements, and
      #then update the "max_first" and the corresponding "element_index" accordingly
        if(arr[i] > max_first) then
          max_first = arr[i]
          element_index = i
        end
    end
    
    #Now that we've determined the first largest element, remove that element
    #from the array, so that we can apply the same logic to get the second 
    #largest element in the array. The index of the first largest element is
    #stored in "element_index"
    arr.delete_at(element_index)
    #The value of the second largest element will be stored in the variable
    #"max_second"
    max_second = arr[0]
    for i in 0..arr.length-1 do
      #Compare the first element of the array with the remaining elements, and
      #then update the "max_second" value accordingly
        if(arr[i] > max_second) then
          max_second = arr[i]
        end
    end
    #After the first and the second largest elements have been determined, the  
    #method "max_2_sum" will return the sum of the two largest elements
    return max_first + max_second
  #If the length of the input value is 1, then just return the value of that
  #element
  elsif (arr.length == 1) then
    return arr[0]
  #If the length of the array is 0, then return 0
  else
    return 0
  end
end

def sum_to_n? arr, n
  #This variable stores the sum of two elements of the array
  sum_of_two_elements = 0
  #This variable will return true if the sum of any two values in the array
  #is equal to the input value "n"
  sum_exists = false
  #Check for the sum of two elements only if there are more than 1 elements
  #in the input array
  if(arr.length > 1) then
    #We will take the first element of the array, and sum it with each of the
    #remaining elements in the array, then we will take the second element of
    #the array and sum it with the remaining elements in the array and so on..
    #The first element represents the element which will be summed with the
    #remaining elements
    for i in 0..arr.length-1 do
      #The second for loop traverses the whole array to check the sum of element 
      #arr[i] and arr[j]
      for j in i+1..arr.length-1 do
        sum_of_two_elements = arr[i] + arr[j]
        if(sum_of_two_elements == n) then
          #If the sum is same as the input value "n", set the sum_exists flag
          #to true
          sum_exists = true
          #Since we found at least one pair of elements in the array that match
          #the value "n", we do not need to continue looping through the remaining
          #elements, so this break eliminates the execution of the inner loop
          break
        end
      end
      #If the flag sum_exists is true, which means we already found the pair of
      #elements with the same value as "n", so we do not need to continue  
      #looping through the outer loop either
      if(sum_exists) then
          break
      end
    end
    #The method returns the value of sum_exists
    return sum_exists
  #Return false if the length of the array is less than or equal to 1
  elsif (arr.length == 1) then
    return false
  else
    return false
  end
end

# Part 2

def hello(name)
  #Concatinate Hello and the input value name
  return "Hello, " + name
end

def starts_with_consonant? s
  #if the input string is empty, return false
  if(s.empty?) then
    return false
  else
    #The first expression in the if, capitalizes the first letter of the input
    #string and returns true if the string does NOT start with any of the vowels
    #The second part of the expression returns true if the string starts with
    #alphabets only
    if(((s.capitalize() =~ /\A+[AEIOU]/) == nil) && !!(s =~ /\A+[a-zA-Z'-]/)) then
      return true
    else
      return false
    end
  end
end

def binary_multiple_of_4? s
  #If the string is empty, return false
  if(s.empty?) then
    return false
  else
    #Verify if the string contains only 0's and 1's
    if(!!(s =~ /\A[0-1]*\z/)) then
      #Split all the characters in the string to return an array of characters
      chars = s.split('')
      #The index of the element will be used to calculate the value of 
      #2 raised to power exponential(index), which is required to convert a
      #binary value to a decimal number
      index = chars.length - 1
      #This variable stores the final value of the converted binary number to 
      #decimal
      binary_to_decimal = 0
      for i in 0..index do
        #Logic to calculate the binary value to decimal value
        if(chars[i] == '1') then
          binary_to_decimal = binary_to_decimal + power(2, index-i)
        end
      end
      #To check if the final decimal number is a multiple of 4, the modulus(%) 
      #function should return the value 0
      check_multiple_of_4 = binary_to_decimal%4
      if(check_multiple_of_4 == 0) then
        return true
      else
        return false
      end
    #If the string contains anything other than 0's and 1's, return false
    else
      return false
    end
  end
end

#Calculates the exponential value of a number
def power base, exponential
  power = 1
  i = 0
  while i < exponential do
    power = power*base
    i += 1
  end
  return power
end

# Part 3

class BookInStock
  def initialize(isbn, price)
    #If the value of input isbn is empty or null, throw an Argument Error
    if(isbn.empty?) then
      raise ArgumentError, "ISBN cannot be null"
    #Otherwise assign the value of input to the class variable
    else
      @isbn = isbn
    end
    #If the value of input price is less than or equal to 0, throw an Argument 
    #Error
    if(price < 1) then
      raise ArgumentError, "Price cannot be less than or qual to 0"
    #Otherwise assign the value of input to the class variable
    else
      @price = price
    end
  end
  
  #Getters and Setters
  attr_reader :isbn
  attr_writer :isbn
  
  attr_reader :price
  attr_writer :price
  
  #This method returns the value of the price as a two place floating point 
  #value concatinated with a $ sign
  def price_as_string
    price_as_floating_point = '%.2f' % @price
    formatted_price = "$" + price_as_floating_point.to_s
    return formatted_price
  end
end


