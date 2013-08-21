require_relative '../../src/sorting_methods'

describe SortingMethods do
  
  describe 'test' do
    it 'hello' do
      SortingMethods.hello.should == true  
    end
  end
  
  describe 'bubble sort' do
    it '4,3,2,1' do
      result = SortingMethods.bubble_sort([4,3,2,1])
      result.should == [1,2,3,4]
    end
    
    it '1,2,3,4' do
      result = SortingMethods.bubble_sort([1,2,3,4])
      result.should == [1,2,3,4]
    end
    
    it '3,4,5,6,1,2' do
      result = SortingMethods.bubble_sort([3,4,5,6,1,2])
      result.should == [1,2,3,4,5,6]
    end
  end
  
  describe 'merge sort' do
    it '4,3,2,1' do
      result = SortingMethods.merge_sort([4,3,2,1])
      result.should == [1,2,3,4]
    end
    
    it '1,2,3,4' do
      result = SortingMethods.merge_sort([1,2,3,4])
      result.should == [1,2,3,4]
    end
    
    it '3,4,5,6,1,2' do
      result = SortingMethods.merge_sort([3,4,5,6,1,2])
      result.should == [1,2,3,4,5,6]
    end
    
    it '3,4,5,6,1,2,10,11,13,12,20' do
      result = SortingMethods.merge_sort([3,4,5,6,1,2,10,11,13,12,20])
      result.should == [1,2,3,4,5,6,10,11,12,13,20]
    end
  end
  
  describe 'merge' do
    it '[1,2][3,4]' do
      result = SortingMethods.merge([1,2], [3,4])
      result.should == [1,2,3,4]
    end
    
    it '[1][2]' do
      result = SortingMethods.merge([1], [2])
      result.should == [1,2]
    end
  end
  
  
  describe 'selection sort' do
    it '3,2,1' do
      result = SortingMethods.selection_sort([3,2,1])
      result.should == [1,2,3]
    end
    
    it '1,2,3,4' do
      result = SortingMethods.selection_sort([1,2,3,4])
      result.should == [1,2,3,4]
    end
    
    it '3,4,5,6,1,2' do
      result = SortingMethods.selection_sort([3,4,5,6,1,2])
      result.should == [1,2,3,4,5,6]
    end
  end
  
end
