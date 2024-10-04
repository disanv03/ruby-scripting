# Replacing multiple patterns in a single pass

class String
  def mgsub(key_value_pairs=[].freeze)
    regexp_fragments = key_value_pairs.collect { |k,v| k }
    gsub(Regexp.union(*regexp_fragments)) do |match|
      key_value_pairs.detect{|k,v| k =~ match}[1]
    end
  end
end

str = "I like apples and bananas"
replacements = [[/apples/, 'fruit'], [/bananas/, 'berries']]
puts str.mgsub(replacements)

