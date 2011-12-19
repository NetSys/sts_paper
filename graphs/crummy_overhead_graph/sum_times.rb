#!/usr/bin/ruby

total = 0

STDIN.each{|line|
    tstr = line.chomp.split("m")
    total += tstr[0].to_f * 60
    total += tstr[1].gsub(/s/,"").to_f
}
puts total    
