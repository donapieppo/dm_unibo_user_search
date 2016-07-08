#!/usr/bin/env ruby

require 'dm_unibo_user_search'

name = ARGV.join

puts "in search of #{name}"

p res = DmUniboUserSearch::Client.new.find_user(name)

res.users.each do |user|
  p user
end

