#!/usr/bin/env ruby
def gen_values(range=100)
  values = values = (1..range*10).to_a.sample(range)
end

sample_handle = File.open('sample_file.txt', 'w')

values = gen_values(ARGV[0].to_i)

values.each do |value|
  sample_handle.write(value.to_s + "\n")
end

