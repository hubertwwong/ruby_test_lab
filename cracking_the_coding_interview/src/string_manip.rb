class StringManip
  
  # testing to see if rspec iis setup correctly.
  def self.hello
    true
  end
  
  # if there is a duplicate character...
  def self.dupe_chars?(some_str)
    # init array that store count
    # init to zero
    count_chars = Array.new(256, 0)
    
    # error check.
    # return false if does not exist.
    if some_str.nil? || some_str.empty?
      return false
    end
    
    # array test.
    array_test = Array.new(1,1)
    array_test[0] += 33
    #puts array_test[0].to_s
    
    # check against each characters in a string.
    some_str.length.times do |i|
      count_chars[some_str[i].ord.to_i] += 1
      #puts 'new lenth ' +  some_str[i].ord.to_s + ' || ' + count_chars[some_str[i].ord.to_i].to_s + ' on ' + some_str[i].to_s
    end
    
    # check if there is a dupe.
    # basically count chars should either be zero or 1.
    # if its 2, return false.
    puts 'gets here ' + some_str
    count_chars.each_with_index do |item, i|
      #puts '> ' + i.to_s + ' || ' + count_chars[i].to_s
      if count_chars[i] >= 2
        #puts 'returning ' + i.to_s
        return false
      end
    end
    
    # return result
    puts 'end'
    return true
  end
  
end