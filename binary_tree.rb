require './node.rb'

def add_single_val(value)
  head = Node.new(value)   
  head   
end
def load_file(filename='sample_file.txt')
  handle = File.readlines(filename)
end
def load_array(array)

  head = 0
  array.each do |line|
    if array[0] == line
      head = Node.new(line)
    else
      head.add(Node.new(line))
    end
  end
  head
end




if ARGV[0] == nil   
  sample_array = load_file
else 
  sample_array = load_file(ARGV[0])
end
head = load_array(sample_array)


# puts "Output file?"
# output = gets.chomp 

# if output
  
# end