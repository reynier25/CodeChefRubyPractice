# Chef has an array A consisting of N integers (1-based indexing). He asks you to perform the following operation M times:


# 	for i = 2 to N:
# 		Ai = Ai + Ai-1
# Your task is to find the xth element of the array (i.e., Ax) after performing the above operation M times. As the answer could be large, please output it modulo 109 + 7.

# Input
# The first line of input contains an integer T denoting the number of test cases.
# The first line of each test case contains three space-separated integers — N, x, and M — denoting the size of the array, index of the element you need to find, and the amount of times you need to repeat operation before finding the element, respectively. The second line contains N space-separated integers A1, A2, …, AN.
# Output
# For each test case, output a single line containing one integer: Ax modulo 109 + 7.

# Constraints
# 1 ≤ T ≤ 10
# 1 ≤ x ≤ N ≤ 105
# 1 ≤ M ≤ 1018
# 1 ≤ Ai ≤ 1018
# Subtasks
# Subtask 1 (8 points):
# 1 ≤ x ≤ min{2, N}
# Subtask 2 (24 points):
# 1 ≤ N * M ≤ 106
# Subtask 3 (68 points): No additional constraints
# Example
# Input:
# 2
# 3 2 3
# 1 2 3
# 3 3 3 
# 1 2 3

# Output:
# 5
# 15
# Explanation
# Values in the array A:

# Before the operations: [1, 2, 3]
# After the first operation: [1, 3, 6]
# After the second operation: [1, 4, 10]
# After the third operation: [1, 5, 15]
# Since input file can be fairly large (about 8 MB), it's recommended to use fast I/O (for example, in C++, use scanf/printf instead of cin/cout).

mod = 1000000007
@cache = {}

def fast_pow(base, n, m = 1000000007)
  return @cache[base] if @cache[base]
  return 1 if n==0
  return base if n==1
  halfn = fast_pow(base, n/2, m)
  if n%2==0 
    @cache[base] = ( halfn * halfn ) % m;
  else
    @cache[base] = ( ( ( halfn * halfn ) % m ) * base ) % m;
  end
  @cache[base]
end

def modular_multiplicative_inverse(n, m = 1000000007)
  fast_pow(n, m-2, m)
end

def modmul(a, b, c = 1000000007)
  ((a%c)*(b%c))%c
end

def moddiv(a, b, c = 1000000007) # works if c is prime
  modmul(a, modular_multiplicative_inverse(b, c))
end

def modadd(a, b, c = 1000000007)
  ((a%c)+(b%c))%c
end

def modsub(a, b, c = 1000000007)
  ((a%c)-(b%c)+c)%c
end

def build_cache
  # t1 = Time.now
  100000.times do |i|
    x = i+1
    @cache[x] = modular_multiplicative_inverse(x) unless @cache[x]
  end
  # puts Time.now - t1
end

#######################################################

build_cache
tests = STDIN.gets.to_i
tests.times do |test|
  # t1 = Time.now
  n, x, m = STDIN.gets.split(" ").map(&:to_i)
  ary = gets.split.map(&:to_i)
  # t2 = Time.now
  # puts t2 - t1
  # puts ary.size
  x -= 1
  ans = 0
  q = 1
  c = 0
  while x >= 0 do
    ans = modadd(ans, modmul(q, ary[x]))
    x -= 1
    q = moddiv( modmul(q, (m+c)) , (c+1))
    # print "#{q} "
    c += 1
  end
  puts ans
end


