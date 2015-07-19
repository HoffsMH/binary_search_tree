require 'pry'
class Node
  attr_accessor :value, :left, :right
  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
  def add(node)
    
    if self.value  > node.value
      if self.left == nil
        self.left = node
      else
        left.add(node)
      end
    elsif self.value < node.value
      if self.right === nil
        self.right = node
      else
        right.add(node)
      end
    end
    
  end
  def max
    if self.right == nil
      return self
    else
      right.max
    end
  end
  def min
    if self.left == nil
      return self
    else
      left.min
    end
  end
  
  def search(value)
    if self.value == value
      return true
    elsif self.value > value
      if self.left.nil?
        return false
      else
        left.search(value)
      end
    elsif self.value < value
      if self.right.nil?
        return false
      else
        right.search(value)
      end
    else
      return false
    end
    
  end
  
  
end

