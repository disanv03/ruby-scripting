# Reversing a String by Words or Characters

s = ".sdrawkcab si gnirts sihT"
puts s.reverse


s = "order. wrong the in are words These"
s.split(/(\s+)/).reverse.join('')
puts s
