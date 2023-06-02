while line = gets
    break if line.chomp.downcase == 'exit'
    line.chomp.split.each do |chunk|
        count = 0
        character = ''

        if chunk == "nl"
            puts "\n"
            next
        elsif chunk =~ /sp$|bS$|sQ$/  # $ sign to say that matches the end of string
            count = chunk[0...-2].to_i  # isolate le last two character (sp,bS...)

            # map abbreviations to characters
            character = ' ' if chunk[-2..] == "sp"
            character = '\\' if chunk[-2..] == "bS"
            character = '\'' if chunk[-2..] == "sQ"
        else  
            count = chunk[0...-1].to_i # everything expect the last one
            character = chunk[-1]  # become the last element
        end

        count.times { print character }
    end
end
