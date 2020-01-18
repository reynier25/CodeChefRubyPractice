# For positive integer x let define function F(x) = 1 * (1! + x) + 2 * (2! + x) + .. + x * (x! + x).

# "k!" means factorial: k! = 1 * 2 * .. * k

# Chef wants to calculate F(p1) + F(p2) + ... + F(pn).

# As answer could be large, help him, calculate value modulo m.

# Input
# First line contains two integers n and m.
# Next line contains n space separated integers pi.
# Output
# Output a single line containing one integer --- calculated value modulo m.
# Constraints
# 1 ≤ n ≤ 105
# 1 ≤ pi ≤ 1018
# 1 ≤ m ≤ 107
# Subtasks
# Subtask #1: 1 ≤ pi ≤ 6 (10 points)
# Subtask #2: 1 ≤ pi ≤ 7 * 103 (25 points)
# Subtask #3: m - prime number (25 points)
# Subtask #4: original constraints (40 points)
# Example
# Input:
# 5 7
# 1 2 3 4 5

# Output:
# 6

# Explanation

# F(1) = 1 * (1! + 1) = 2

# F(2) = 1 * (1! + 2) + 2 * (2! + 2) = 3 + 8 = 11

# F(3) = 1 * (1! + 3) + 2 * (2! + 3) + 3 * (3! + 3) = 4 + 10 + 27 = 41

# F(4) = 1 * (1! + 4) + 2 * (2! + 4) + 3 * (3! + 4) + 4 * (4! + 4) = 5 + 12 + 30 + 112 = 159

# F(5) = 1 * (1! + 5) + 2 * (2! + 5) + 3 * (3! + 5) + 4 * (4! + 5) + 5 * (5! + 5) = 794

# F(1) + F(2) + F(3) + F(4) + F(5) = 2 + 11 + 41 + 159 + 794 = 1007 

# 1007 modulo 7 = 6

require 'prime'
input = gets.chomp.split()
mod = input[1].to_i
array = gets.chomp.split().map(&:to_i)
array.sort! {|x,y| y<=>x}
factHash = Hash[0, 1]
sumHash = Hash[0, 0]
max = 1
if mod.prime? then max = mod
elsif mod > 1
    primeHash = mod.prime_division
    primeHash.each do |key, val|
        temp = key * val
        max = max < temp ? temp : key
    end
end
max = max - 1 < array[0] ? max - 1 : array[0]
1.upto(max) do |ele|
    factHash[ele] = ele * factHash[ele - 1] % mod
    sumHash[ele] = sumHash[ele - 1] + ele * factHash[ele] 
end
sum = 0
array.each do |ele|
    tempMax = max < ele ? max : ele
    sum += (sumHash[tempMax] + (((ele) * (ele + 1) / 2) * ele))
end
puts sum % mod

