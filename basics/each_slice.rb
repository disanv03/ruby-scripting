a = []
(1..10).each_slice(3) {|tuple| a.push(tuple)}
a # => [[1, 2, 3], [4, 5, 6], [7, 8, 9], [10]]

a = []
h = {foo: 0, bar: 1, baz: 2, bat: 3, bam: 4}
h.each_slice(2) {|tuple| a.push(tuple)}
a # => [[[:foo, 0], [:bar, 1]], [[:baz, 2], [:bat, 3]], [[:bam, 4]]]
