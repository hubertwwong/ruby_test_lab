require_relative '../../../src/modules/car'

describe Foo::Car do
  
  describe 'test' do
    it 'hello' do
      Foo::Car.hello.should == "hello"  
    end
  end
  
end