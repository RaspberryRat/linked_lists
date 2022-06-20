class LinkedList
  def initialize
    @head = nil
    @tail = nil
  end

  # used to find the last node in list to update @tail
  def find_final_node(node = @head, prev_node = nil)
    return prev_node if node.nil?

    find_final_node(node.next, prev_node = node)
  end

  def append(value)
    return @head = Node.new(value) if @tail.nil? && @head.nil?

    @tail = Node.new(value)
    find_final_node.update_next_node(@tail)
  end

  def prepend(value)
    new_head = Node.new(value, @head)
    @head = new_head
  end

  def size(node = @head, count = 0)
    return count if node.nil?

    size(node.next, count += 1)
  end

  def head
    @head
  end

  def tail
    @tail
  end

  # Find node at an index location. Begin/rescue needed if index doesn't exist
  def at(index, location = 0, node = @head)
    return node if location == index

    begin
      node.next
    rescue NoMethodError
      return nil
    else
      at(index, location += 1, node.next)
    end
  end

  # Removes last node in linked list
  def pop
    @tail = at(size.to_i - 2)
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

  # Changes print method to print out linked list of node name and node value
  def to_s(next_node = @head)
    return print "nil\n "if next_node.nil?
  
    print "(#{next_node.node_name} | #{next_node.node_value}) -> "
    next_node = to_s(next_node.next)
  end

  def insert_at(value, index)
    return "No node at index\n" if index > size.to_i - 1

    current_node_at_index = at(index)
    previous_node_at_index = at(index.to_i - 1)

    return append(value) if current_node_at_index.nil?

    return prepend(value) if previous_node_at_index.nil?

    new_node = Node.new(value, current_node_at_index)
    previous_node_at_index.update_next_node(new_node)
  end

  def remove_at(index)
    return "No node at index\n" if index > size.to_i - 1

    previous_node_at_index = at(index.to_i - 1)
    next_node_at_index = at(index.to_i + 1)

    # sets index 1 to new head if remove_at called on head
    return @head = at(1) if previous_node_at_index.nil?

    previous_node_at_index.update_next_node(next_node_at_index)
  end
end

class Node
  # class variable needed to assign names
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

  # Assigns a name to node starting from A - Z, then AA, BB
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

print "Value: 30: at location: #{l.find(30)}\n\n"

print l.at(19)

print "#{l}\n\n" 

l.insert_at("I'm new",2)
print "#{l}\n\n" 
l.remove_at(1)

print "#{l}\n\n" 
