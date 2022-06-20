require "pry-byebug"

class LinkedList
  attr_accessor :list
  def initialize
    @list = []
    @head = nil
    @tail = nil
  end

  # if prepend called
  # check if @head == nil, if so, assign to head, not sure about pointer yet
  # if not nil, assign new node to head, point next_value to previous head

  def navigate_list(node = 0)
    #first find when next_node == nil
    # then go back to previous non-nil, areturn to append, so new @tail can be properly linked to previous tails @next node
    return node if node.nil?

    node = navigate_list(@head.next)
    puts node
    node
  end

  def append(value)
  
      #start at @head, follow linked list until nil 
    new_tail = Node.new(value)
    list << new_tail
    update_tail(new_tail)
    # adds a new node containined value to end of list
  end

  def prepend(value)
    if @head.nil?
      new_head = Node.new(value)
    else
      previous_head = @head
      new_head = Node.new(value, previous_head)
    end
    update_head(new_head)
    # adds a new node containing a value to the start of the list
  end

  def update_head(new_node)
    @head = new_node
  end

  def update_tail(new_node)
    @tail = new_node
  end

  def size
    list.length
    # returns total number of nodes in list
  end

  def head
    # returns node at position 0
    @head
  end

  def tail
    @tail
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
    # will need to navigate entire list to do this
    print "#{@head.name} -> #{@head.next_node.name} -> #{@tail.name} - > nil \n\n"
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
print "head = #{l.head}\n" 
print "tail = #{l.tail}\n"
l.prepend("second")
print "head = #{l.head}\n"
l.navigate_list

print "full list: #{l}"
