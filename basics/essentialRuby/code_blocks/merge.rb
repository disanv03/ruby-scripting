#############################
# Merge
#############################
# used for hashes only
# merges two hashes together
# block can provide rules to use when merging

# merge: without a block
h1 = {:a => 2, :b => 4, :c => 6}
h2 = {:a => 3, :b => 4, :d => 8}

h1.merge(h2)
# {:a => 3, :b => 4, :c => 6, :d => 8}
# the new value merged won :a => 3

# merge: with a block
h1.merge(h2) {|key,old,new| old }
# => {:a => 2, :b => 4, :c => 6, :d => 8}

h1.merge(h2) {|k,o,n| o < n ? o : n}
h1.merge(h2) {|k,o,n| o * n}



