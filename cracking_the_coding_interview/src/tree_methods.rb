require_relative 'tree_node'

class TreeMethods

  # testing to see if rspec iis setup correctly.
  def self.hello
    true
  end

  # does a basic bst insert.
  # assumes values are unique.
  # assuming you are just inserting ints.
  # assumes a base node.
  def self.bst_insert(cur_node, num)
    if cur_node == nil
      nil
    elsif cur_node.value > num
      if cur_node.left == nil
        cur_node.left = TreeNode.new
        cur_node.left.value = num
        true
      else
        self.bst_insert(cur_node.left, num)
      end
    elsif cur_node.value < num
      if cur_node.right == nil
        cur_node.right = TreeNode.new
        cur_node.right.value = num
        true
      else
        self.bst_insert(cur_node.right, num)
      end
    end
    true
  end

  # use pre in post for the order
  def self.traverse(cur_node, order)
    if order == "pre"
      puts cur_node.value.to_s
    end
    if cur_node.left != nil
      self.traverse(cur_node.left, order)
    end
    if order == "in"
      puts cur_node.value.to_s
    end
    if cur_node.right != nil
      self.traverse(cur_node.right, order)
    end
    if order == "post"
      puts cur_node.value.to_s
    end
  end

  def self.n_level_tree(some_int)
    if some_int == 0
      nil
    end
  end

end