require_relative '../../../src/modules/honda'

describe Honda do
  
  describe 'test' do
    it 'hello' do
      Honda.hello.should == "hello"
    end
    
    it 'speed' do
      Honda.speed.should == 55
    end
    
    it 'name' do
      Honda.name.should == "Honda"
    end
  end
  
end