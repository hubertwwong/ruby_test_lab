# assume its a string
class SingleLinkedList
  
  attr_accessor :first
  
  # testing to see if rspec iis setup correctly.
  def self.hello
    true
  end
  
  def find(str)
    # kick things off
    cur_node = self.first
    
    while cur_node != nil
      
      if cur_node.value == str
        return cur_node
      elsif cur_node.next != nil
        puts "s> " + cur_node.value
        cur_node = cur_node.next
      else
        puts "s> " + cur_node.value
        break
      end
    end
    
    nil
  end
  
  def insert_end(node)
    # kick things off
    cur_node = self.first
    
    # first node.
    if cur_node == nil
      puts 'insert first'
      self.first = node
      return true
    end
    
    while cur_node != nil
      if cur_node.next != nil
        puts 'traversing'
        cur_node = cur_node.next
      else
        # found insertion point 
        cur_node.next = node
        puts 'inserting ' + cur_node.next.value
        break
      end
    end
  end
  
  def insert_after(node, some_str)
    # kick things off
    cur_node = self.first
    
    # first node.
    if cur_node == nil
      #puts 'insert first'
      self.first = node
      return true
    end
    
    while cur_node != nil
      if cur_node.value == some_str
        #puts 'found insertion point'
        # saving next node pointer.
        next_node = cur_node.next
        # storing param node so you can modify it.
        temp_node = node
        # updating the param next to the 'next node'
        temp_node.next = next_node
        # insert param node.
        cur_node.next = temp_node
        #cur_node.next = next_node
        return true
      elsif cur_node.next != nil
        #puts 'traversing'
        cur_node = cur_node.next
      else
        break
      end
    end
    
    false
  end
  
  def print_all
    # kick things off
    cur_node = self.first
    
    while cur_node != nil
      if cur_node.next != nil
        puts "> " + cur_node.value
        cur_node = cur_node.next
      else
        puts "> " + cur_node.value
        break
      end
    end
  end
  
end