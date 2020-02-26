# Chef is sitting in a very boring lecture, waiting for it to end. He has recently asked his friend about the time, and instead of the straightforward answer, his friend, being an absolute jerk, told him the absolute value of angle between hour and minute hands.

# But that is obviously not what he wanted to know, so he asks you to help him, by writing down all valid values of time (in hours and minutes, both non-negative integers) from midnight (inclusive) to noon (not inclusive) which satisfy the information Chef's friend has provided. Keep in mind that a time value is considered valid if the angle between the clock's hands for that value and the angle Chef's friend has described differ by less than 1/120 degrees.

# Note that the movement of the minute hand influences the hour hand. That is, every minute, it moves by 1/60th of the angular distance between two consecutive hour marks.

# Input
# The first line of the input contains an integer T denoting the number of test cases.

# The only line of each test case contain a single real number A in decimal notation, denoting the angle between minute and hour hands. The fractional part won't contain more than 4 digits.

# Output
# For each test case print all valid values of time as described in the statement in the format "hh:mm" (without quotes), where hh means number of hours, and mm the number of minutes. Times should be printed in chronological order.

# Constraints and Subtasks
# 1 ≤ T ≤ 105
# 0 ≤ A ≤ 180
# Output won't exceed 1 MB.
# Subtask 1: (30 points)

# A is an integer from the set {0, 90, 180}.
# Subtask 2: (30 points)

# A is an integer.
# Subtask 3: (40 points)

# No additional constraints.
# Example
# Input:
# 2
# 0
# 30

# Output:
# 00:00
# 01:00
# 11:00

def abs(x)
	return x if x >= 0
	return -1 * x
end

def adapt(x)
	return x if x <= 180
	return 360 - x
end

def stringify(hh, mm)
	if hh < 10
		hh = "0" + hh.to_s
	else
		hh = hh.to_s
	end

	if mm < 10
		mm = "0" + mm.to_s
	else
		mm = mm.to_s
	end

	return hh + ":" + mm
end

time_hash = Hash.new
0.upto(11) do |hh|
	0.upto(59) do |mm|
		hh = hh.to_f
		mm = mm.to_f

		theta_h = 0.5 * (60 * hh + mm)
		theta_m = 6 * mm

		theta = adapt(abs(theta_h - theta_m))

		time_hash[stringify(hh.to_i, mm.to_i)] = theta
	end
end

t = gets.to_i
mem_hash = Hash.new
t.times do |xx|
	a = gets.to_f
	if mem_hash[a]
		arr = mem_hash[a]
		arr.each do |x|
			puts x
		end
		next
	end
	arr = []
	time_hash.each do |x, y|
		arr << x if abs(a - y) <= 1.0 / 120.0
	end
	mem_hash[a] = arr
	arr.each do |x|
		puts x
	end
end


