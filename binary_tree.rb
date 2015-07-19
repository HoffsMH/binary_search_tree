require './node.rb'

def add_single_val(value)
  head = Node.new(value)   
  head   
end

def load_from_file
  sample_handle = File.readlines('sample_file.txt')
  head = 0
  sample_handle.each do |line|
    if sample_handle[0] == line
      head = Node.new(line)
    else
      head.add(Node.new(line))
    end
  end
  sample_handle
end

sample_handle = load_from_file