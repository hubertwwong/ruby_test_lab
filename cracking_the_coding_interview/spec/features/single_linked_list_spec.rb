require_relative '../../src/single_linked_list'
require_relative '../../src/single_node'

describe SingleLinkedList do
  
  describe 'test' do
    it 'hello' do
      SingleLinkedList.hello.should == true  
    end
  end
  
  describe 'node' do
    it 'node inits correctly' do
      sn1 = SingleNode.new
      sn1.value = 'foo'
      sn1.value.should == 'foo'
    end
    
    it 'next node works correctly' do
      sn1 = SingleNode.new
      sn2 = SingleNode.new
      sn1.value = 'foo'
      sn2.value = 'bar'
      sn1.next = sn2
      
      result = sn1.next
      result.value.should == 'bar'
    end
  end
  
  describe 'single link list' do
    xit 'testing simple insert' do
      sl = SingleLinkedList.new
      sn1 = SingleNode.new
      sn2 = SingleNode.new
      sn3 = SingleNode.new
      sn1.value = 'foo'
      sn2.value = 'bar'
      sn3.value = 'baz'
      
      sl.insert_end(sn1)
      sl.insert_end(sn2)
      sl.insert_end(sn3)
      
      # print test
      sl.print_all
      
      # check if array is not nil
      sl.should_not be_nil
    end
    
    xit 'testing find' do
      sl = SingleLinkedList.new
      sn1 = SingleNode.new
      sn2 = SingleNode.new
      sn3 = SingleNode.new
      sn1.value = 'foo'
      sn2.value = 'bar'
      sn3.value = 'baz'
      
      sl.insert_end(sn1)
      sl.insert_end(sn2)
      sl.insert_end(sn3)
      
      # check last thing
      sl.find('baz').value == 'baz'
    end
    
    it 'testing find' do
      sl = SingleLinkedList.new
      sn1 = SingleNode.new
      sn2 = SingleNode.new
      sn3 = SingleNode.new
      sn1.value = 'foo'
      sn2.value = 'bar'
      sn3.value = 'baz'
      
      # insert node
      sins = SingleNode.new
      sins.value = 'zzz'
      
      sl.insert_end(sn1)
      sl.insert_end(sn2)
      sl.insert_end(sn3)
      
      # inserting
      sl.insert_after(sins, 'bar')
      
      # testing results.
      sl.print_all
      
      sl.find('zzz').value == 'zzz'
    end
  end
  
end