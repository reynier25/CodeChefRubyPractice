# You are given two positive integers – A and B. You have to check whether A is divisible by all the prime divisors of B.

# Input
# The first line of the input contains an integer T denoting the number of test cases. The description of T test cases follows.

# For each test case, you are given two space separated integers – A and B.

# Output
# For each test case, output "Yes" (without quotes) if A contains all prime divisors of B, otherwise print "No".

# Constraints
# 1 ≤ T ≤ 104
# 1 ≤ A, B ≤ 1018
# Subtasks
# Subtask 1 (20 points):1 ≤ B ≤ 107
# Subtask 2 (30 points):1 ≤ A ≤ 107
# Subtask 3 (50 points): Original constraints
# Example
# Input:
# 3
# 120 75
# 128 16
# 7 8

# Output:
# Yes
# Yes
# No

# Explanation
# Example case 1. In the first case 120 = 23*3*5 and 75 = 3*52. 120 is divisible by both 3 and 5. Hence, we will print "Yes"

# Example case 2. In the second case both 128 and 16 are powers of two. Hence, the answer is "Yes"

# Example case 3. In the third case 8 is power of two and 7 is not divisible by 2. So, the answer is "No"

def solve(a,b)
  gcd_num = a.gcd(b)
  b = b/gcd_num
  return 'Yes' if(gcd_num%b == 0)
  return 'No' if(gcd_num == 1)
  return solve(gcd_num,b) 
end

T = gets.to_i
T.times do
    a,b = gets.split(' ').map(&:to_i)
    ans = 'Yes'
    if (b%2 == 0 && a%2 != 0)
        ans = 'No'
    elsif (b ==1)
        ans = 'Yes'
    else
        ans = solve(a,b)
    end
    puts ans
end


