require_relative '../../../src/modules/honda'

describe Honda do
  
  describe 'test' do
    it 'hello' do
      expect(Honda.hello).to be == "hello"
    end
    
    it 'speed' do
      expect(Honda.speed).to be == 55
    end
    
    it 'name' do
      expect(Honda.name).to be == "Honda"
    end
  end
  
end