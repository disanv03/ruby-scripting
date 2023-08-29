# Multiplying Matrices
#
# Problem: You want to turn arrays of arrays of numbers into mathematical matrices,
# and multiply the matrices together.

require 'matrix'

a1 = [[1,1,0,1],
      [2,0,1,2],
      [3,1,1,2]]
m1 = Matrix[*a1]
puts m1

a2 = [[1,0],
      [3,1],
      [1,0],
      [2,2.5]]
m2 = Matrix[*a2]
puts m2

puts m1 * m2

# Here how the multiplication work
#
# m1 = | 1 1 0 1 |       m2 = | 1   0 |
#      | 2 0 1 2 |            | 3   1 |
#      | 3 1 1 2 |            | 1   0 |
#                             | 2 2.5 |

# m1 * m2 = | (1*1 + 1*3 + 0*1 + 1*2) (1*0 + 1*1 + 0*0 + 1*2.5) |
#           | (2*1 + 0*3 + 1*1 + 2*2) (2*0 + 0*1 + 1*0 + 2*2.5) |
#           | (3*1 + 1*3 + 1*1 + 2*2) (3*0 + 1*1 + 1*0 + 2*2.5) |

#         = | 6 2.5 |
#           | 6 5   |
#           | 9 5   |
