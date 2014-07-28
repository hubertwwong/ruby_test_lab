require_relative '../../../src/modules/toyota'

describe Toyota do
  
  describe 'test' do
    it 'hello' do
      expect(Toyota.hello).to be == "hello"
    end
    
    it 'speed bike' do
      expect(Toyota.speed).to be == 5
    end
  end
  
end