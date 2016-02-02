require 'calculator'

input_path = ARGV[0]
puts "input: #{input_path}\noutput:"
Calculator.eval(input_path).each { |result| puts "=> #{result}" }
