def multiplication_table(n,range)
    for i in 1..range do
        puts "#{n} x #{i} = #{n * i}"
    end
end

def all_tables(range = 10)
    for i in 1..10 do
        puts "Multiplication table of #{i} :"
        multiplication_table(i, range)
        puts ""
    end
end

# print table
table_of_7 = (1..10).map { |i| i * 7 }
p table_of_7

# with subarray
multi_tables = (2..10).map { |i| (1..10).map { |j| i * j } }
p multi_tables

