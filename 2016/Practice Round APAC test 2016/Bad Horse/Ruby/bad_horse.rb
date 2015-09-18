#!/bin/env ruby

class DFS
  attr_reader :adj_list, :parent

  def initialize(adj_list = {})
    @adj_list = adj_list
    @parent = {}
  end

  def build(starting_node)
    @parent[starting_node] = :none
    dfs_visit!(starting_node, @adj_list[starting_node])
  end

  def dfs_visit!(node, adj_list_of_node)
    adj_list_of_node.each do |vertex|
      if !(parent.has_key?(vertex)) #if vertex is NOT in parent hash, it has not been explored
        parent[vertex] = node
        dfs_visit!(vertex,@adj_list[vertex])
      end
    end
  end
end

adj = {}

test_case = gets.chomp
league_members = []
hash = Hash.new { |h, k| h[k] = [] }

for i in 0...test_case.to_i
  has_duplicates = false
  member_exists = false
  invalid_name = false
  n_pairs = gets.chomp

  for j in 0...n_pairs.to_i
    troublesome_pairs = gets.chomp

    # Each member name will consist of only letters and the underscore character.
    troublesome_member = troublesome_pairs.split
    league_members += troublesome_member
  end

  # Each pair will contain two distinct League members.
  league_members.each_slice(2) do |key, value|
    hash[key] << value
  end

  adj = hash
  dfs = DFS.new(adj)
  dfs.build(league_members[0])
  dfs.parent.each do |key, value|
    # No pair will appear more than once in the same test case.
  end

  # No pair will appear more than once in the same test case.
  league_members.each do |member|
    for k in 0...hash[member].size
      # Each member name will consist of only letters and the underscore character.
      if (hash[member][k].include?('_'))
        if (member.eql?(hash[member][k]) || member == hash[member][k] || hash[member][k] == hash[member][k - 1])
          member_exists = true
          invalid_name = false
        else
          member_exists = false
          invalid_name = false
        end
      else
        invalid_name = true
      end

    end
  end

  if league_members.uniq.length == league_members.length
    has_duplicates = false
  else
    has_duplicates = true
  end

  if (member_exists == true && invalid_name == true)
    puts "Case ##{i += 1}: No"
  elsif (member_exists == true && invalid_name == false)
    puts "Case ##{i += 1}: No"
  elsif (member_exists == false && invalid_name == true)
    puts "Case ##{i += 1}: No"
  elsif (member_exists == false && invalid_name == false)
    puts "Case ##{i += 1}: Yes"
  end

  # puts "Case ##{i += 1}: " + has_duplicates.to_s
end
