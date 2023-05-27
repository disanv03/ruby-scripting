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
