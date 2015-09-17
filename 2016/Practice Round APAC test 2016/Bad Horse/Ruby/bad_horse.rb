#!/bin/env ruby

test_case = gets.chomp
league_members = []
hash = Hash.new { |h, k| h[k] = [] }

for i in 0...test_case.to_i
  has_duplicates = false
  n_pairs = gets.chomp

  for j in 0...n_pairs.to_i
    troublesome_pairs = gets.chomp

    troublesome_member = troublesome_pairs.split
    league_members += troublesome_member
  end

  league_members.each_slice(2) do |key, value|
    hash[key] << value
  end

  if league_members.uniq.length == league_members.length
    has_duplicates = false
  else
    has_duplicates = true
  end

  puts "Case ##{i += 1}: " + has_duplicates.to_s
end
