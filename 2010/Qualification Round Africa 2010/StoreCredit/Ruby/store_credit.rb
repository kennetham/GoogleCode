#!/bin/env ruby

# test_case = gets.chomp
#
# for i in 0...test_case.to_i
#   store_credit = gets.chomp
#   n_items = gets.chomp
#   l_item = gets.chomp
#
#   item = l_item.split
#   item_index = Array.new
#   is_found = false
#   has_duplicates = false
#
#   hash = Hash.new { |h, k| h[k] = [] }
#   duplicate_items = Hash.new { |h, k| h[k] = [] }
#   item.each_index { |i| duplicate_items[item[i]] << i unless 1 == item.count(item[i]) }
#   item.each_with_index do |val, idx|
#     hash[val] << idx
#   end
#
#   if item.uniq.length == item.length
#     has_duplicates = false
#   else
#     has_duplicates = true
#   end
#
#   store_items = item.product(item)
#
#   # result = []
#   # item.each do |x|
#   #   item.reverse.each do |y|
#   #     result << [x, y]
#   #   end
#   # end
#
#   item.combination(2) { |a, b|
#     if (a.to_i + b.to_i == store_credit.to_i && is_found == false)
#       if (hash[a] == hash[b])
#         item_index.push(hash[a][0] + 1, hash[b][1] + 1)
#       else
#         item_index.push(item.index("#{a.to_i}") + 1, item.index("#{b.to_i}") + 1)
#       end
#
#       is_found = true
#     elsif (is_found == true)
#       if (item_index[0] > item.index("#{a.to_i}") + 1)
#         item_index.clear
#
#         if (hash[a] == hash[b])
#           item_index.push(hash[a][0] + 1, hash[b][1] + 1)
#         else
#           item_index.push(item.index("#{a.to_i}") + 1, item.index("#{b.to_i}") + 1)
#         end
#       end
#     end
#   }
#
#   puts "Case ##{i += 1}: " + item_index.to_a.join(" ").to_s
# end

class StoreCredit
  public

  def max_sum(numbers, max)
    total_length = numbers.length
    last_index = total_length - 1
    sums = {}
    best = {}
    return -1 if total_length == 0

    (0..last_index).each { |l_index|
      (l_index..last_index).each { |r_index|
        if numbers[r_index]
          sub_array = numbers[l_index..r_index]

          if sums[[l_index, r_index - 1]]
            sum = sums[[l_index, r_index - 1]] + sub_array.last

            if sum <= max
              best[sum] = [l_index + 1, r_index + 1]
            end
          else
            sum = sub_array.reduce(:+)
          end

          sums[[l_index, r_index]] = sum
        end
      }
    }

    # max_item = sums.invert[sums.values.max]

    best
  end

  def kadane_algorithm(numbers)
    n = numbers.length
    max_current = -1
    max = max_current

    for i in 0..n do
      if max_current < 0
        max_current = numbers[i].to_i
      else
        max_current += numbers[i].to_i
      end

      if max_current > max
        max = max_current
      end
    end

    max
  end
end

# store = [150, 24, 79, 50, 88, 345, 3]
store_credit = StoreCredit.new
# puts store_credit.max_sum(store, 200)

test_case = gets.chomp

for i in 0...test_case.to_i
  amount = gets.chomp.to_i
  n_items = gets.chomp
  l_item = gets.chomp

  item = l_item.to_s.split.map(&:to_i)
  # result = store_credit.max_sum(item, amount)

  result = store_credit.kadane_algorithm(item)

  # if result[amount].nil?
  #   p result
  # else
  #   left, right = result[amount]
  # end

  puts "Case ##{i += 1}: #{result}" ##{left} #{right}
end
