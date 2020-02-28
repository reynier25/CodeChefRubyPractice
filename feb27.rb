# Rupsa really loves triangles. One day she came across an equilateral triangle having length of each side as an integer N. She started wondering if it was possible to transform the triangle keeping two sides fixed and alter the third side such that it still remains a triangle, but the altered side will have its length as an even integer, and the line drawn from the opposite vertex to the mid-point of the altered side is of integral length.

# Since Rupsa is in a hurry to record a song for Chef as he really loves her songs, you must help her solve the problem as fast as possible.

# Input
# The first line of input contains an integer T denoting the number of test cases.

# Each test-case contains a single integer N.

# Output
# For each test case, output "YES" if the triangle transformation is possible, otherwise "NO" (quotes for clarity only, do not output).

# Constraints
# 1 ≤ T ≤ 106
# 1 ≤ N ≤ 5 x 106
# Sub tasks
# Subtask #1: 1 ≤ T ≤ 100, 1 ≤ N ≤ 104 (10 points)
# Subtask #2: 1 ≤ T ≤ 104, 1 ≤ N ≤ 106 (30 points)
# Subtask #3: Original Constraints (60 points)
# Example
# Input:
# 2
# 5
# 3

# Output:
# YES
# NO
# Explanation
# In test case 1, make the length of any one side 6, and it will suffice.

def valid(n)
	sqrt = n
	1.upto(sqrt - 1) do |x|
		metric = Math.sqrt(n**2 - x**2)
		return true if metric % 1 == 0
	end
	return false
end

def to_text(b)
	return "YES" if b
	return "NO"
end

t = gets.to_i
mem_hash = Hash.new
t.times do |tt|
	n = gets.to_i
	if mem_hash[n]
		puts mem_hash[n]
		next
	end

	result = to_text(valid(n))
	mem_hash[n] = result
	puts result
end


