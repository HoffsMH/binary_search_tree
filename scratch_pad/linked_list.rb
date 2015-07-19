
require 'pry'

class Node
  attr_accessor :value, :next_node
  def initialize(value=0, next_node= nil)
    @value = value
    @next_node  = next_node
    
  end
  def add_node(node)
    @next_node = node

  end
  def traverse(node=self)
    # puts "#{self.value}.next_node: #{@next_node.value}"
  
    if get_next(node)
      return node.value
    else
      return [node.value, get_next(node).traverse]
    end
    
  end
  def get_next(node)
    node.next_node
  end
end

head = Node.new('Hi')
next_guy = Node.new('there')

head.add_node(next_guy)
puts head.traverse


#he described some functions and what I need to do is distinguish all the things
#that I need to do and find out 1 if they are really the same
#and 2 if  they are not and i need something completely else
# at this point i not only need to make a design decision about whether or not 
# I am going to to this iteratively or recursively
# i need to make a decision about how I want to understand it first

#lets just continue with the this stab at it for now