# Devu loves to play with binary strings a lot. One day he borrowed a binary string s of size n from his friend Churu. Before starting to play with it, he wants to make sure that string does not contain more than k consecutive equal characters. For achieving that, only kind of operation he is allowed to perform is to flip any ith character of the string.

# As Devu is always in hurry to meet his girlfriend, he wants you to help him in finding out the minimum number of operations he will need. Also he wants you to print one of the possible modified string too.

# Input
# First line of input contains an integer T denoting the number of test cases.
# For each test case, there are two lines.
# First line contains two space separated integers n, k as defined in the problem.
# Next line contains string s of size n.
# Output
# For each test case, print two lines.
# First line should contain an integer corresponding to minimum number of operations Devu needs.
# In second line, print one of the possible modified strings.
# Constraints
# Subtask #1: 20 points

# 1 ≤ T ≤ 100, 1 ≤ n ≤ 20, 1 ≤ k ≤ n
# Subtask #2: 35 points

# 1 ≤ T ≤ 102, 1 ≤ n ≤ 103, 1 ≤ k ≤ n
# Subtask #3: 45 points

# 1 ≤ T ≤ 105, 1 ≤ n ≤ 105, 1 ≤ k ≤ n
# Sum of n over all the test cases is ≤ 106
# Example
# Input:
# 3
# 2 1
# 11
# 2 2
# 11
# 4 1
# 1001

# Output:
# 1
# 10
# 0
# 11
# 2
# 1010
# Explanation
# Example case 1: As 1 is occurring twice consecutively, we can convert 11 to 10 in a single operation.

# Example case 2: You don't need to modify the string as it does not have more than 2 equal consecutive character.

# Example case 3: As 0 is occurring twice consecutively, we can convert 1001 to 1010 in a two operations (Flip third and fourth character).

def encode(string)
  string.scan(/(.)(\1*)/).collect do |char, repeat|
    [1 + repeat.length, char]
  end
end

def flip(a)
  if a == '0' then '1' else '0' end
end

def fix(s, k)
  if s.size > k
    (k...(s.size)).step(k + 1) do |i|
      s[i] = flip(s[i])
    end
    if s[-1] != s[0]
      s[-1], s[-2] = s[-2], s[-1]
    end
  end
  s
end

def main
  n, k = gets.split.map &:to_i
  s = gets.chomp!
  if k == 1
    answer = 0
    n.times do |i|
      answer += (s[i].to_i - i % 2).abs
    end
    if answer < n - answer
      puts answer
      puts ('01' * n).slice!(0,n)
    else
      puts n - answer
      puts ('10' * n).slice!(0,n)
    end

  else
    e = encode(s)
    answer = e.collect { |i| fix(i[1] * i[0], k) }.join
    puts n.times.collect {|i| (answer[i] == s[i]) ? 0 : 1}.reduce(:+)
    puts answer
  end
end
gets.to_i.times { main }


