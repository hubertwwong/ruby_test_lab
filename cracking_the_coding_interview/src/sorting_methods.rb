class SortingMethods

  # testing to see if rspec iis setup correctly.
  def self.hello
    true
  end
  
  # remember that you are going through both loops.
  # completely.
  # and swapping pairs up to N times.
  # programming opimization is to change it so it halts if it does swap
  # in a given pass.
  def self.bubble_sort(array_arg)
    if array_arg.nil?
      return false
    end
    
    final_array = array_arg
    
    i = 0
    while i < array_arg.length - 1
      j = 0
      
      while j < array_arg.length - 1
        # swap if initial item is larger than n item.
        if final_array[j] > final_array[j+1]
          # puts 'swapping ' + final_array[j].to_s + ' with ' + final_array[j+1].to_s 
          temp_var = final_array[j+1]
          final_array[j+1] = final_array[j]
          final_array[j] = temp_var
        end
        # increment i
        j+=1
      end
      # increment i
      i+=1
    end
    
    return final_array
  end

  def self.merge_sort(array_arg)
    if array_arg.nil?
      return false
    end
    
    # if its just 1 item, just return it.
    if array_arg.length == 1
      return array_arg
    end
    
    # do the split
    mid = array_arg.length / 2
    left_a = array_arg[0..mid-1]
    right_a = array_arg[(mid)..(array_arg.length-1)]
    #puts "> l " + left_a.inspect
    #puts "> r " + right_a.inspect
    final_left_a = self.merge_sort(left_a)
    final_right_a = self.merge_sort(right_a)
    self.merge(final_left_a, final_right_a)
  end
  
  # makes an assumption that you are using
  def self.merge(a1, a2)
    final_array = Array.new
    
    if a1.nil? || a2.nil?
      return nil
    end
    
    # both items need 1 item
    if a1.length < 1 || a2.length < 1
      return nil
    end
    
    a1_index = 0
    a2_index = 0
    both_length = a1.length + a2.length
    both_length.times do |i|
      if a1_index == a1.length
        final_array.push(a2[a2_index])
        a2_index+=1
      elsif a2_index == a2.length
        final_array.push(a1[a1_index])
        a1_index+=1
      elsif a1[a1_index] < a2[a2_index]
        final_array.push(a1[a1_index])
        a1_index+=1
      else
        final_array.push(a2[a2_index])
        a2_index+=1
      end
    end
    
    final_array
  end

  # remember the diff of selction and bubble sort.
  # bubble sort does the swaps as its using the second pointer.
  # selection sort swaps againnst the first node.
  def self.selection_sort(array_arg)
    if array_arg.nil?
      return false
    end
    
    final_array = array_arg
    
    i = 0
    while i < array_arg.length
      j = i + 1
      
      while j < array_arg.length
        # swap if initial item is larger than n item.
        if final_array[i] > final_array[j]
          temp_var = final_array[i]
          final_array[i] = final_array[j]
          final_array[j] = temp_var
        end
        j+=1
      end
      i+=1
    end
    
    return final_array
  end
  
end