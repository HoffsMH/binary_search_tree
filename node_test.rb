gem 'minitest', '~>5.0'

require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/spec'
require 'pry'

require './node.rb'
require './binary_tree'

describe "driver_code" do
  it "can load a single value into a node" do
    expected =  2
    result  = add_single_val(2).value
    
    assert_equal(expected, result)
    
  end
  it "can load a file with one value into a node" do
    
    sample_handle = File.readlines('sample_file.txt')
    head = 0
    sample_handle.each do |line|
      if sample_handle[0] == line
        head = Node.new(line)
      else
        head.add(Node.new(line))
      end
    end
    
    expected = sample_handle[0]
    result = head.value
    

    assert_equal(expected, result)
    
    
    
  end
  it "can load a file with many values into many nodes"
end
describe Node do
  describe ".new(value)" do
    it "makes a new Node object" do
      result =  Node.new(3).class
      expected = Node
      
      assert_equal(expected, result)
    end
    it "makes a new Node object with a value" do
      head = Node.new(4)
      
      expected = 4
      result = head.value
      
      assert_equal(expected, result)
    end
    it "makes a new Node object with a nil left and right attr" do
      head = Node.new(1)
      expected = nil
      result = head.left
      assert_equal(expected, result)
      
    end
    it "makes a new Node object with a Left attr" do
      head = Node.new(5)
      head.left = "hi"
      
      expected = "hi"
      result  = head.left
      
      assert_equal(expected, result)       
    end
    
    it "makes a new Node object with a right attr" do
      head = Node.new(5)
      head.right = "hi"
      
      expected = "hi"
      result  = head.right
      
      assert_equal(expected, result)       
      
    end
    
    it "makes a new Node object whose right and left attr can be another node object" do
      head = Node.new(4)
      head.right = Node.new(5)
      
      expected = 5
      result = head.right.value
      
      assert_equal(expected, result)
    end
    it "puts a random string as dummy info on a node"
  end
  describe "add(head)" do
    it "can add a a node to the right of a head node (when there is only the head in the tree)" do
      head = Node.new(5)
      right_node = Node.new(6)
      head.add(right_node)
      
      result = head.right.value
      expected = right_node.value
      
      assert_equal(expected, result)
      
    end
    it "can add a node to the left of a head node( when there is only the head in the tree)" do
      head = Node.new(5)
      left_node = Node.new(3)
      head.add(left_node)
      
      result = head.left.value
      expected = left_node.value
      
      assert_equal(expected, result)
    end
    it "can add a node to the left of the head node (when there is one node to the left of the head)" do
      
      head = Node.new(5)
      left_node = Node.new(3)
      left_node2 = Node.new(2)
      head.add(left_node)
      head.add(left_node2)
      
      result = head.left.value
      expected = left_node.value
      assert_equal(expected, result)
      
      expected = left_node2
      result = left_node.left
      assert_equal(expected, result)
      
    end
    it "can add a node to the right of the head node (when there is one node to the right of the head)" do
      
      head = Node.new(5)
      right_node = Node.new(7)
      right_node2 = Node.new(6)
      head.add(right_node)
      head.add(right_node2)
      
      result = head.right.value
      expected = right_node.value
      
      assert_equal(expected, result)
      
      result = right_node.left.value
      expected = right_node2.value
      
      assert_equal(expected, result)
    end
    it "does not make duplicate nodes" do
      
      head = Node.new(5)
      right_node = Node.new(7)
      right_node2 = Node.new(7)
      head.add(right_node)
      head.add(right_node2)
      
      result = head.right.value
      expected = right_node.value
      
      assert_equal(expected, result)
      
      result = head.right.right
      expected = nil
      
      assert_equal(expected, result)
      
      
      result = head.right.left
      expected = nil
      
      assert_equal(expected, result)
    end
    
    
  end
  describe ".max()" do
    it "returns head if head is only node in tree" do
      head = Node.new(1)
      
      expected = head
      result = head.max
      
      assert_equal(expected, result)
    end
    it "returns 1 right from head if there is one" do
      head = Node.new(1)
      head.add(Node.new(3))
      
      expected = head.right
      result = head.max
      
      assert_equal(expected, result)
    end
    it "returns 2 right from head if there is one" do
      head = Node.new(1)
      head.add(Node.new(3))
      head.add(Node.new(5))
      
      expected = head.right.right.value
      result = head.max.value
      
      assert_equal(expected, result)
    end
    it "never makes a left turn while searching" do
      head = Node.new(1)
      head.add(Node.new(5))
      head.add(Node.new(3))
      
      expected = head.right.value
      result = head.max.value
      
      assert_equal(expected, result)
    end
  end
  describe ".min()" do
    it "returns head if head is only node in tree" do
      head = Node.new(1)
      
      expected = head
      result = head.min
      
      assert_equal(expected, result)
    end
    it "returns 1 left from head if there is one" do
      head = Node.new(3)
      head.add(Node.new(1))
      
      expected = head.left
      result = head.min
      
      assert_equal(expected, result)
    end
    it "returns 2 left from head if there is one" do
      head = Node.new(5)
      head.add(Node.new(3))
      head.add(Node.new(1))
      
      expected = head.left.left.value
      result = head.min.value
      
      assert_equal(expected, result)
    end
    it "never makes a right turn while searching" do
      head = Node.new(5)
      head.add(Node.new(1))
      head.add(Node.new(3))
      
      expected = head.left.value
      result = head.min.value
      
      assert_equal(expected, result)
    end
  end
  describe ".search(value)" do
    it "returns true or false if the head element is the one we are searching for" do
      
      head = Node.new(3)
      
      expected = true
      result = head.search(3)
      
      assert_equal(expected, result)
      
      
    end
    it "returns false if the head element if NOT the one we are searching for" do
      
      head = Node.new(3)
      
      expected = false
      result = head.search(1)
      
      assert_equal(expected, result)
      
    end
    it "returns true if the left element is the one we are searching for" do
      
      head = Node.new(3)
      left_node = Node.new(1)
      head.add(left_node)
      
      
      expected = true
      result = head.search(1)
      
      assert_equal(expected, result)
      
    end
    it "returns true if the right element is the one we are searching for" do
      
      head = Node.new(3)
      right_node = Node.new(4)
      head.add(right_node)
      
      
      expected = true
      result = head.search(4)
      
      assert_equal(expected, result)
      
    end
    
    it "returns true if the element is on the right " do
      
      head = Node.new(3)
      right_node = Node.new(5)
      right_node2 = Node.new(4)
      
      head.add(right_node)
      head.add(right_node2)
      
      
      expected = true
      result = head.search(4)
      
      assert_equal(expected, result)
      
    end
    it "returns true if the element is on the left" do
      
      head = Node.new(6)
      left_node = Node.new(1)
      left_node2 = Node.new(4)
      
      head.add(left_node)
      head.add(left_node2)
      
      
      expected = true
      result = head.search(4)
      
      assert_equal(expected, result)
      
    end
    
  end
  describe ".sort" do
    it "returns a one element array if head is the only node" do
      head = Node.new(2)
      expected = [2]
      result = head.sort
      
      assert_equal(expected, result)
    end
    it "returns a two element array if there are 2 nodes" do
      head = Node.new(2)
      head.add(Node.new(1))
      expected = [1,2]
      result = head.sort
      
      assert_equal(expected ,result)
    end
    it "returns a 3 element array if there are 3 nodes. One on the right one on the left" do
      head = Node.new(3)
      head.add(Node.new(1))
      head.add(Node.new(4))
      expected = [1,3,4]
      result = head.sort
      
      assert_equal(expected ,result)
    end
    it "returns a 3 element array if there are 3 nodes. two on the left" do
      head = Node.new(5)
      head.add(Node.new(4))
      head.add(Node.new(3))
      expected = [3,4,5]
      result = head.sort
      
      assert_equal(expected ,result)
    end
    it "returns a 4 element array if there are 4 nodes. two on the left one on the right" do
      head = Node.new(5)
      head.add(Node.new(4))
      head.add(Node.new(3))
      head.add(Node.new(6))
      expected = [3,4,5,6]
      result = head.sort
      
      assert_equal(expected ,result)
    end
    it "returns a 5 element array if there are 5 nodes. fork on the left and one on the right" do
      head = Node.new(7)
      head.add(Node.new(4))
      head.add(Node.new(5))
      head.add(Node.new(3))
      head.add(Node.new(8))
      expected = [3,4,5,7,8]
      result = head.sort
      
      assert_equal(expected ,result)
    end
    
    it "returns a 6 element array if there are 6 nodes. fork on both sides" do
      head = Node.new(7)
      head.add(Node.new(4))
      head.add(Node.new(5))
      head.add(Node.new(3))
      head.add(Node.new(10))
      head.add(Node.new(8))
      head.add(Node.new(12))
      expected = [3,4,5,7,8,10,12]
      result = head.sort
      
      assert_equal(expected ,result)
    end
    it "can sort lots of numbers" do
      array_to_be_sorted = (1..1000).to_a.sample(100)
      head = load_array(array_to_be_sorted)
      
      expected = array_to_be_sorted.sort
      result = head.sort           
      
      assert_equal(expected, result)       
    end
    
  end
  describe ".sort_to_file(filename)" do
    it "takes a parameter and creates a file in the paramter's name" do
      head = Node.new(15)
      head.sort_to_file('sorted_array.txt')
      
      result = File.file?('sorted_array.txt')  
      expected = true  
      
      assert_equal(expected, result)
    end
    it "sorts the tree and prints the sorted values in ascending order into the file one value per line" do
      array_to_be_sorted = values = values = (1..1000).to_a.sample(100)
      head = load_array(array_to_be_sorted)
      
      head.sort_to_file('sorted_array.txt')
      
      result = head.sort
      expected = array_to_be_sorted.sort
      
      assert_equal(expected, result)
    end
  end
  describe ".delete(value)" do
  end
  
  describe ".to_s" do
    it "prints a single node tree to terminal" do
      skip
    end
    it "prints a 2 node tree to terminal" do
      skip
    end
    
    it "prints a 3 node tree to terminal"
    it "prints a simple tree to terminal"
    it "prints a less simple tree to terminal"
    
  end
  
  
  
end




