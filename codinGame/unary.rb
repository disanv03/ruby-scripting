message = gets.chomp

def encode_message(message)
    binary = message.chars.map { |char| char.ord.to_s(2).rjust(7, '0') }.join
    encoded_message = ''
    i = 0
    while i < binary.length
            count = 1
            if binary[i] == '1'
                encoded_message += '0 '
            else
                encoded_message += '00 '
            end

            while i + 1 < binary.length and binary[i] == binary[i + 1]
                i += 1
                count += 1
            end

            encoded_message += '0' * count
            encoded_message += ' '
            i += 1
    end
    return encoded_message.rstrip
end

puts encode_message(message)
