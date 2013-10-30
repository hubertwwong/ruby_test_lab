require_relative '../../src/tree_methods'
require_relative '../../src/tree_node'

describe TreeMethods do
  
  describe 'test' do
    it 'hello' do
      TreeMethods.hello.should == true  
    end
  end

  describe 'tree_insert' do
    it '3 nodes' do
      root = TreeNode.new
      root.value = 2
      
      # insert 2 nodes.
      TreeMethods.bst_insert(root, 1)
      TreeMethods.bst_insert(root, 3)
      
      # traversal and testing.
      current_node = root.left
      current_node.value.should == 1
      
      current_node = root.right
      current_node.value.should == 3
    end
    
    it '7 nodes' do
      root = TreeNode.new
      root.value = 4
      
      # insert 2 nodes.
      TreeMethods.bst_insert(root, 2)
      TreeMethods.bst_insert(root, 6)
      TreeMethods.bst_insert(root, 1)
      TreeMethods.bst_insert(root, 3)
      TreeMethods.bst_insert(root, 5)
      TreeMethods.bst_insert(root, 7)
      
      # traversal and testing.
      current_node = root.left
      current_node.value.should == 2
      current_node = current_node.left
      current_node.value.should == 1
      
      current_node = root.right
      current_node.value.should == 6
      current_node = current_node.left
      current_node.value == 5
      
      # TreeMethods print.
      puts 'pre'
      TreeMethods.traverse(root, 'pre')
      puts 'in'
      TreeMethods.traverse(root, 'in')
      puts 'post'
      TreeMethods.traverse(root, 'post')
    end
  end
  
end
