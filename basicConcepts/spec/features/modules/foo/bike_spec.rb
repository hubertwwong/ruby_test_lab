require_relative '../../../../src/modules/foo/bike'

describe Foo::Bike do
  
  describe 'test' do
    it 'hello' do
      Foo::Bike.hello.should == "hello"
    end
  end
  
end