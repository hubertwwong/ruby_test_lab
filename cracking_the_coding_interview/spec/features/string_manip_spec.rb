require_relative '../../src/string_manip'

describe StringManip do
  
  describe 'test' do
    describe 'hello' do
      StringManip.hello.should == true
    end
  end
  
  describe 'string basics' do
    describe 'dupe_str' do
      context 'bad cases return false' do
        it 'null' do
          result = StringManip.dupe_chars? nil
          result.should == false    
        end
        
        it 'hello' do
          result = StringManip.dupe_chars? 'hello'
          result.should == false
        end
      end
      
      context 'good cases' do
        it 'felt' do
          result = StringManip.dupe_chars? 'felt'
          result.should == true
        end
      end
    end
    
    describe 'reverse_str' do
      context 'bad cases return false' do
        it 'nil' do
          result = StringManip.reverse_str nil
          result.should == false
        end
      end
      
      context 'good cases' do
        it 'felt' do
          result = StringManip.reverse_str 'felt'
          result.should == 'tlef'
        end
        
        it 'abcde' do
          result = StringManip.reverse_str 'abcde'
          result.should == 'edcba'
        end
      end
    end
  end
  
end