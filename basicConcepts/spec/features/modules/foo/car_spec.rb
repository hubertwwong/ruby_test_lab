require_relative '../../../../src/modules/foo/car'

describe Fluffy::Car do
  
  describe 'test' do
    it 'hello' do
      expect(Fluffy::Car.hello).to be == "hello"
    end
  end
  
end