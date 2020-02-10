# A number is called as a lucky number if its decimal representation contains only the lucky digits, 4 and 7. e.g. 47, 744, 4 are lucky numbers, whereas 5, 17, 467 are not.

# Recently, Na2a found a magic stone. With the help of this stone, he can multiply a number by any lucky number. Also, the magic stone can be used any number of times (possibly zero or infinite number of times).
# For example, if initially he has the number 1, then he can get numbers like 28 (formed by 1*4*7), 14476 (formed as 1*47*77*4) etc.

# Na2a has N numbers in his bag which are denoted by array A. For each number Ai in his bag, he asks you to transform it to a number with maximum possible number of trailing zeroes by using Magic Stone. You have to find the smallest of such numbers, since there can be multiple numbers with the maximum possible number of trailing zeros.

# Input
# There is a single test case.
# First line contains a single integer N as stated in the problem.
# The second line contains N space-separated integers A1, A2, ... , AN where Ai denotes the ith number in the bag.
# Output
# Output N lines, in which ith line contains the answer corresponding to the number Ai.
# Constraints
# 1 ≤ N ≤ 105
# 1 ≤ Ai ≤ 109
# Subtasks
# Subtask 1(8 points)

# 1 ≤ N ≤ 10
# 1 ≤ Ai ≤ 10

# Subtask 2(22 points)

# 1 ≤ N ≤ 102
# 1 ≤ Ai ≤ 103

# Subtask 3(70 points)

# Original constraints
# Example
# Input:
# 2
# 2 15

# Output:
# 2
# 60
# Explanation
# Example case 1. You can't get any number having zeros at the end multiplying 2 by lucky numbers.

# Example case 2. You can multiply 15 by 4 and get 60, which has one trailing zero.

require "set"

$cache = {0 => 1, 1 => 4, 2 => 4}
def f(k)
	return $cache[k] if $cache[k]
	mod = 1 << k
	queue = [[4, 4%mod]]
	used_r = Set.new
	loop {
		x, r = queue.shift
		for y in [4, 7]
			new_r = (r * 10 + y) % mod
			new_x = x * 10 + y
			next if used_r.include?(new_r)
			used_r << new_r
			if new_r == 0
				$cache[k] = new_x
				return $cache[k]
			end
			queue << [new_x, new_r]
		end
	}
end

table = [1,4,4]
for i in 3..12
	table[i] = f(i)
	for j in 1..i/2
		table[i] = [table[i], table[j] * table[i-j]].min
	end
end

n = gets.to_i
bag = gets.split.map(&:to_i)

bag.each{|x0|
	k5 = 0
	x = x0
	while x % 5 == 0
		k5 += 1
		x /= 5
	end

	k2 = 0
	x = x0
	while x % 2 == 0
		k2 += 1
		x /= 2
	end

	p x0 * table[ [k5 - k2, 0].max ]
}


