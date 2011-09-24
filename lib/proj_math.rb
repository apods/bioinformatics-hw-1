def hamming_distance(v, w)
  v_arr = v.upcase.split("")
  w_arr = w.upcase.split("")
  return nil unless v_arr.size == w_arr.size
  return nil unless !v_arr.empty?
  
  distance = 0
  v_arr.each_index do |i|
    if v_arr[i] != w_arr[i]
      distance += 1
    end
  end
  distance
end

def hamming_distance_ltd(v, w)
  v_arr = v.upcase.split("")
  w_arr = w.upcase.split("")
  w_arr = w_arr[0, v.length]
  return nil unless v_arr.size == w_arr.size
  
  distance = 0
  v_arr.each_index do |i|
    if v_arr[i] != w_arr[i]
      distance += 1
    end
  end
  distance
end

def max_distance(v, dna)
  distance = 0
  c_dist = 0
  strands = dna.all_strands
  strands.each do |strand|
    c_dist = hamming_distance_ltd(v, strand)
    if c_dist > distance
      distance = c_dist
    end
  end
  distance
end

def min_sequence(sequences)
  curr_min = sequences[0]
  for i in 1 .. sequences.length - 1
    if sequences[i][1] < curr_min[1]
      curr_min = sequences[i]      
    end
  end
  return curr_min
end








