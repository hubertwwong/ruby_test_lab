require_relative '../../../src/modules/toyota'

describe Toyota do
  
  describe 'test' do
    it 'hello' do
      Toyota.hello.should == "hello"
    end
    
    it 'speed bike' do
      Toyota.speed.should == 5
    end
  end
  
end