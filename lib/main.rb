class LinkedList
  def append(value)
    # adds a new node containined value to end of list
  end

  def preprend(value)
    # adds a new node containing a value to the start of the list
  end

  def size
    # returns total number of nodes in list
  end

  def head
    # returns node at position 0
  end

  def tail
    # returns node at position -1
  end

  def at(index)
    # returns node at index location
  end

  def pop
    # removes element element in the list
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
  def value
    return nil

  end

  def next_node
    return nil

  end

end