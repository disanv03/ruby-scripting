# Bill loves to stack cubes. He is most known for his skill of being able to balance
# larger cubes on top of each other.
# When Bill is given an assortement of cubes, he always stacks them in ascending order
# from bottom up.
# Help Bill find the total exposed (non-overlapping) surface area when he stacks his
# cubes in ascending order from bottom up.
# Note that surface area consists of only the area exposed by the object, i.e areas
# where the cubes touch each other/the ground are excluded.

# Explanation of the first testcase: Bill is given 3 cubes of side lenghts 2, 1 and 3
# respectively. We know that Bill stacks his cubes in ascending order from bottom up,
# so the cube of sidelength 1 will be at the bottom, 2 in the middle, and 3 at the top.
# Since we are excluding the overlapping areas, the bottom cube will have a total surface
# area of 4 (bottom face touches ground, top face touches middles cube).
# The second cube will have an area of 19 (top face touches top cube, bottom face, partially
# overlapped by the bottom cube). The third and final cube will have an area of 50 (bottom face
# partially overlapped, top face exposed). Adding these all up, we get the expected answer 73.

# In:
# Line 1: An integer N for the number of cubes that Bill has
# Next N lines: Side length of each cubes.
# Out:
# Line 1: The maximum surface area that Bill can create

# To solve this problem, we first sort the cubes in ascending order.
# For the bottom-most cube (the smallest one), the exposed surface area
# would be 5 x side**2 since its bottom face touches the ground and its top
# face will be overlapped by the next cube.
#
# For all middle cubes (excluding the bottom-most and top-most), the exposed surface area would
# be 4 x side**2 + side** - previous side**2.
# Here:
#   4xside**2 represents the 4 side faces
#   (side**2 is the top face of the cube) - (previous side**2) is the overlapped area from the cube below

# For the top-most cube (the largest one), the exposed surface area would be 5 x side**2 as its top face
# is also exposed.

n = gets.to_i
cubes = n.times.map { gets.to_i }.sort

surface_area = 0

# Bottom cube
surface_area += 5 * cubes[0] ** 2

# Middle cubes
(1...n-1).each do |i|
  surface_area += 4 * cubes[i] ** 2
  surface_area += cubes[i] ** 2 - cubes[i-1] ** 2
end

# Top cube (if there's more than 1 cube)
surface_area += 5 * cubes[-1] ** 2 if n > 1

puts surface_area
