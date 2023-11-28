# Simulating Keyword Arguments
# Problem:
# A function or method can accept many optional arguments. You want to let callers pass in only the
# arguments they have values for, but Ruby doesn't support keyword arguments as Python and Lisp do.

def fun_with_text(text, args={})
  text = text.upcase if args[:upcase]
  text = text.downcase if args[:downcase]
  if args[:find] and args[:replace]
    text = text.gsub(args[:find], args[:replace])
  end
  text = text.slice(0, args[:truncate_at]) if args[:truncate_at]
  return text
end

# Different call inside a function
p fun_with_text("Foobar", {:upcase => true, :truncate_at => 5})
p fun_with_text("Foobar", :upcase => true, :truncate_at => 5)
p fun_with_text("Foobar", find: /(o+)/, replace: '\1d', downcase: true)

# KeywordProcessor module, designed to handle keyword ensuring meandatory parameters are
# provided and rejecting any unknown parameters.
module KeywordProcessor
  MANDATORY = :MANDATORY

  def process_params(params, defaults)
    #reject unknown params
    params.keys.each do |key|
      unless defaults.has_key? key
        raise ArgumentError, "No such keyword argument: #{key}"
      end
    end
    result = defaults.dup.update(params)
    #check for mandatory params
    unfilled = result.select { |k,v| v == MANDATORY }.map { |k,v| k.inspect }
    unless unfilled.empty?
      msg = "Mandatory keyword parameter(s) not given: #{unfilled.join(', ')}"
      raise ArgumentError, msg
    end
    return result
  end

end

class TextCanvas
  include KeywordProcessor

  def render(text, args={}.freeze)
    args = process_params(args, {:font => 'New Reykjavik Solemn',
                                 :size => 36,
                                 :bold => false,
                                 :x => :MANDATORY,
                                 :y => :MANDATORY }.freeze)
    # ...
    puts "DEBUG: Found font #{args[:font]} in catalog."
    # ...
  end

end

canvas = TextCanvas.new
canvas.render('Hello', :x => 4, :y => 100)
canvas.render('Hello', :x => 4, :y => 100, :font => 'Lacherlich')
#canvas.render('Hello', :x => 4, :font => 'Lacherlich')
#canvas.render('Hello', :x => 4, :y => 100, :italic => true)


