require "pry-byebug"

class LinkedList
  def initialize
    @head = nil
    @tail = nil
  end

  def find_final_node(node = @head, prev_node = nil)
    #first find when next_node == nil
    # then go back to previous non-nil, areturn to append, so new @tail can be properly linked to previous tails @next node
    return prev_node if node.nil?

    find_final_node(node.next, prev_node = node)
  end

  def append(value)
    return @head = Node.new(value) if @tail.nil? && @head.nil?

    @tail = Node.new(value)
    final_node = find_final_node
    final_node.update_next_node(@tail)
    # adds a new node containined value to end of list
  end

  def prepend(value)
    return @head = Node.new(value) if @head.nil?

    previous_head = @head
    @head = Node.new(value, previous_head)
  end

  def size(node = @head, count = 0)
    # returns total number of nodes in list
    return count if node.nil?

    size(node.next, count += 1)
  end

  def head
    # returns node at position 0
    @head
  end

  def tail
    @tail
  end

  def at(index, location = 0, node = @head)
    return node if location == index

    begin
      node.next
    rescue NoMethodError
      nil
    else
      at(index, location += 1, node.next)
    end


  end

  def pop
    # removes last  element in the list
    list_size = size
    @tail = at(list_size.to_i - 2)
    @tail.update_next_node
  end

  def contains?(value, node = @head)
    return false if node.nil?

    return true if node.value == value

    contains?(value, node.next)
  end

  def find(value, location = 0, node = @head)
    return "Value not in list" if node.nil?

    return location if node.value == value

    find(value, location += 1, node.next)
  end

  def to_s(next_node = @head)
    if next_node.nil?
      print "nil\n"
      return
    end
    # print linklist objects as strings
    # format should be (value) -> (value) -> (value) - nil
    # will need to navigate entire list to do this
    print "(#{next_node.node_name} | #{next_node.node_value}) -> "
    next_node = to_s(next_node.next)
  end


  def insert_at(value, index)
    # inserts a new node with provided value at given index
    # update next_node
    current_node_at_index = at(index)
    previous_node_at_index = at(index.to_i - 1)

    return append(value) if current_node_at_index.nil?

    return prepend(value) if previous_node_at_index.nil?

    
  end

  def remove_at(index)
    # removes node at given index
    # update next_node
  end
end

class Node
  @@number_of_nodes = 0
  attr_accessor :value, :name
  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
    @name = assign_name
    @@number_of_nodes += 1
  end

  def next
    @next_node
  end

  def update_next_node(node = nil)
    @next_node = node
  end

  def node_value
    @value
  end

  def node_name
    @name
  end

  def assign_name
    number_of_characters = @@number_of_nodes / 26 + 1
    node_name = []
    number_of_characters.times do
      node_name.push((@@number_of_nodes % 26 + 65).chr)
    end
    node_name.join('')
  end
end

l = LinkedList.new
l.append(20)
l.prepend("first")
l.append(30)
l.prepend("second")
l.append(70)
l.append(80)



print "#{l}\n\n"

print "#{l.size}\n\n"

print "#{l.at(3)}\n\n"

print "index 1: #{l.at(1).name} and value: #{l.at(1).value}\n\n"
print "#{l.tail}: #{l.tail.name} | #{l.tail.value}\n\n"

l.pop

print "#{l}\n\n"

print "#{l.size}\n\n"

print "contains 30: #{l.contains?("30")}\n\n"

print "Value: 30: at location: #{l.find(323)}\n\n"

print l.at(10)
print l.at(3).name


