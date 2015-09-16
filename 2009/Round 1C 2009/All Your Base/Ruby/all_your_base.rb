#!/bin/ruby

test_case = gets.chomp
k = 1

for i in 0...test_case.to_i
  input = gets.chomp

  begin
    if Integer(input)
      puts "Case ##{k}: " + input.to_s(2)
    end
  rescue
    size = input.size
    queue = Array.new
    digit = 2

    if (size > 1)
      for j in 0...size do
        if (j == 0)
          queue.push(1)
        elsif (j == 1)
          queue.push(0)
        else
          queue.push(digit)
          digit += 1
        end
      end

      result = queue.join("")
      puts "Case ##{k}: " + result.to_i(size).to_s
    end
  end

  k += 1
end
