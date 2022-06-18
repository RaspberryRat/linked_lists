require "pry-byebug"

class LinkedList
  attr_accessor :list
  def initialize
    @list = []
  end

  def append(value)
    list << Node.new.value(value) 
    # adds a new node containined value to end of list
  end

  def prepend(value)
    list.unshift(Node.new.value(value))
    # adds a new node containing a value to the start of the list
  end

  def size
    list.length
    # returns total number of nodes in list
  end

  def head
    # returns node at position 0
    list[0]
  end

  def tail
    list[-1]
  end

  def at(index)
    # returns node at index location
    list[index]
  end

  def pop
    # removes last  element in the list
    list.delete_at(-1)
  end

  def contains?(value)
    # return true if value is in list
  end

  def find(value)
    # return index of node == value
    return nil
  end

  def to_s
    # print linklist objects as strings
    # format should be (value) -> (value) -> (value) - nil
  end

  def insert_at(value, index)
    # inserts a new node with provided value at given index
    # update next_node
  end

  def remove_at(index)
    # removes node at given index
    # update next_node
  end
end

class Node
  def value(node_value = nil)
    [node_value, next_node]
  end

  def next_node(pointer = nil)
    pointer # should be to an index location right?
  end
end

l = LinkedList.new

l.append(20)
l.prepend(100)
l.append(40)
l.prepend(0)
l.prepend(743)
puts "size of list: #{l.size}"
print "first node in list: #{l.head}\n"
print "last node in list: #{l.tail}\n"
print "node at poistion 3: #{l.at(3)}\n"
l.pop











print "full list: #{l.list}"
