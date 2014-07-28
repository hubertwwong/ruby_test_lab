require_relative '../../../../src/modules/foo/bike'

describe Fluffy::Bike do
  
  describe 'test' do
    it 'hello' do
      expect(Fluffy::Bike.hello).to be == "hello"
    end
      
    it 'speed' do
      expect(Fluffy::Bike.speed).to be == 5
    end
  end
  
  # if you load the file directly. you don't need namespaces.
end