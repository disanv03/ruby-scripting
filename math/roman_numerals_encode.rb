#!/usr/bin/ruby

#convert arabic integers to roman numerals
#source: https://github.com/trizen/ruby-scripts

def arabic_to_roman(num)

    lookup = {
        M:1000, CM:900, D:500,
        CD:400, C:100, XC:90,
        L:50, XL:40, X:10,
        IX:9, V:5, IV:4, I:1
    }

    roman = ''

    lookup.each {|k,v|
        while (num >= v)
            roman << k.to_s
            num -= v
        end
    }

    return roman
end

puts arabic_to_roman(1990)
puts arabic_to_roman(2008)
puts arabic_to_roman(1666)