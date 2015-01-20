# SL4. Crazy numbers

# We will rest from TV shows for a while. I mean, I love them, but even sometimes it's nice to just stop and do something else.

# And what else is fun? Numbers! We are going to write a nice Numermaster class that treats with, well... yeah, numbers.

# Its first method will take an array of numbers. If most of them are positive, it should return only the positive ones. If most of them are
# negative, it should return the negative ones. Otherwise (if the amount of positives and negatives is the same) return nil.

# The second method takes a set of numbers. Then, it should return an array with four values:
# 1. The mode
# 2. The median
# 3. The mean
# 4. The size of the array
# In the event that the array we pass is empty, it should just return nil.

# The third and final method will take a positive integer (let's call it "n") as a parameter, and return the n-th Fibonacci number. If the
# parameter is zero or less, it should just return nil. More info: http://en.wikipedia.org/wiki/Fibonacci_number

# Your goal is to follow these three steps:
# 1. Quickly write a first implementation of the three methods.
# 2. Write a nice set of tests for each method.
# 3. Once the test pass, refactor your methods so they are perfect (so perfect that even Ruby creator would see them with joy and pride!)

class CrazyNumbers

  	def set_of_numbers(number_arr)
		count = 0
		number_arr.each { |actual_number| (actual_number > 0) ? (count += 1) : (count -= 1) }
		if (count < 0) 
			return number_arr.select { |number| number < 0 }
		elsif (count > 0)
			return number_arr.select { |number| number > 0 }
		else
			return nil
		end
  	end

	def method_2(number_arr)
		freq = number_arr.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
		mode = number_arr.max_by { |v| freq[v] }

		if ((number_arr.count+1)%2 == 0)
			median =  number_arr.at((number_arr.count+1)/2)
		else
			median = (number_arr[number_arr.count/2] + number_arr[(number_arr.count/2)-1])/2
		end

		mean = 0
		number_arr.each { |num| mean += num }
		mean = (mean.to_f/number_arr.count.to_f)

		return mode, median, mean, number_arr.count
	end

	def fibonacci_number(n)
		return  n  if ( 0..1 ).include? n
		(fibonacci_number(n - 1) + fibonacci_number(n - 2))
	end
end


# TESTING PART
describe CrazyNumbers do
	before do
		@cnumbers = CrazyNumbers.new
	end

	describe "#set_of_numbers" do
		it "Takes an array of numbers. If most of them are positive or negative, it should return only the positive or negative ones. Otherwise nil" do
			array = [1, -1, 3, 14, -327, -25, 250]
			res = @cnumbers.set_of_numbers(array)
			expect(res).to eq([1, 3, 14, 250])
		end

		it "Takes an array of numbers. If most of them are positive or negative, it should return only the positive or negative ones. Otherwise nil" do
			array = [1, -1, -3, 14, 327, -25, -250]
			res = @cnumbers.set_of_numbers(array)
			expect(res).to eq([-1, -3, -25, -250])
		end

		it "Takes an array of numbers. If most of them are positive or negative, it should return only the positive or negative ones. Otherwise nil" do
			array = [1, -1, -3, 14, 327, -25, -250, 6]
			res = @cnumbers.set_of_numbers(array)
			expect(res).to eq(nil)
		end
	end

	describe "#method_2" do
		it "Returns the mode, median, mean and the size of an array of numbers. Nil Otherwise" do
			array = [1, 4, 5, 4, 3]
			res = @cnumbers.method_2(array)
			expect(res).to eq([4, 4, 3.4, 5])
		end
	end

	describe "#method 3" do
		it "Returns the n element of Fibonacci's sequence" do
			fnumber = @cnumbers.fibonacci_number(0)
			expect(fnumber).to eq(0)
		end

		it "Returns the n element of Fibonacci's sequence" do
			fnumber = @cnumbers.fibonacci_number(1)
			expect(fnumber).to eq(1)
		end

		it "Returns the n element of Fibonacci's sequence" do
			fnumber = @cnumbers.fibonacci_number(25)
			expect(fnumber).to eq(75025)
		end
	end
end