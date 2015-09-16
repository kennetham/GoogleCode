#!/bin/ruby

test_case = gets.chomp

for i in 0...test_case.to_i
  input = gets.chomp
  puts "Case ##{i += 1}: " + input.split.reverse.join(" ")
end
