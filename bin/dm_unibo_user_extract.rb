#!/usr/bin/env ruby

require 'dm_unibo_user_search'

name = ARGV.join

puts "in search of #{name}"

p res = DmUniboUserSearch::Client.new.find_user(name)

res.users.each do |user|
  puts "insert into users set id=#{user.id_anagrafica_unica}, name='#{user.name}', surname='#{user.sn}', staff=1, email='#{user.upn}', contact_email='#{user.upn}';"
end

