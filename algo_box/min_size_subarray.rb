# Minimum Size Subarray Sum
# Problem:
# Given an array of positive integers and a target value,
# find the smallest subarray whose sum is equal to or larger than the target.
# Return its length


def min_subarray_len(nums, s)
  # Initialize min_len with positive infinity so any valid
  # subarray length would be smaller  
    min_len = Float::INFINITY
  # Initialize left pointer of the window and the sum of the window
    left = 0
    sum = 0

  # Loop through nums, with 'num' being the value and 'i' being the index
    nums.each_with_index do |num, i|
        sum += num

        # While the sum is greater than or equal to 's', move the window
        while sum >= s
            # See 'note' below
            min_len = [min_len, i + 1 - left].min
            # Subtract the leftmost number from the sum since we are
            # moving the window one step to the right
            sum -= nums[left]
            # Move the left pointer of the window to the right
            left += 1
        end
    end

  # If min_len is still infinity, no subarray was found, so return 0
    min_len == Float::INFINITY ? 0 : min_len
end

puts min_subarray_len([2, 3, 1, 2, 4, 3], 7)
# Output: 2 ([4, 3] or [2, 4, 1])

##################################################
# NOTE:
# This algorithm uses a sliding window technique, a powerful
# method to efficiently find the subarrays that meet certain conditions
#
# Inner While loop:
# Once 'sum' meets or exceeds the target 's', the loop activates.
# (i + 1 - left) computers the length of the current window by
# subtracting the start index from the end index (and adding 1)
# i: points to the current element (or the end of the current window)
# left: points to the start of the current window
##################################################
