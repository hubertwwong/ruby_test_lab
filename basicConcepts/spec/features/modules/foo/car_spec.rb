require_relative '../../../../src/modules/foo/car'

describe Foo::Car do
  
  describe 'test' do
    it 'hello' do
      Foo::Car.hello.should == "hello"
    end
  end
  
end