# Classifying text with a Bayesian Analyzer

require 'rubygems'
require 'classifier'

classifier = Classifier::Bayes.new('Spam', 'Not spam')

classifier.train_spam 'are you in the market for viagra ? we sell viagra'
classifier.train_not_spam 'hi there, are we still on for lunch?'

puts classifier.classify "we sell the cheapest viagra on the market"
puts classifier.classify "lunch sounds great"
