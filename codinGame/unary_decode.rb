encoded_message = gets.chomp

def decode_message(encoded_message)
    message = ''
    binary = ''

    encoded_message.split(' ').each_slice(2) do |slice|
        series, length = slice
        bit = series.length == 1 ? '1' : '0'
        binary += bit * (length ? length.length : 0)
    end

    binary.chars.each_slice(7) do |char_binary|
        message += char_binary.join.to_i(2).chr
    end

    message
end

File.open('output.txt', 'w') do |f|
    f.write(decode_message(encoded_message))
end

