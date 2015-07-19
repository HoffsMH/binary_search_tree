def kill(4) #we give this function value to search and kill
  
  delete_children(search(head))
end

def search(node)
  #does some stuff to get to node we are searching for
  return node #we return a NODE
end

def delete_children(node)
  return subtree #we return a mini tree to be merged with main tree
end
()


head = Node.new

head2 = head.kill(4)
head.merge(subtree)

how to merge subtree with main head again
