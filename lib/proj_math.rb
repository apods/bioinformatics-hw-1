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

def distance(v, dna)
  return nil unless v.length == dna.line_size
  distance = 0
  c_dist = 0
  strands = dna.all_strands
  strands.each_index do |i|
    c_dist = hamming_distance v, strands[i]
    if c_dist > distance
      distance = c_dist
    end
  end
  distance
end

def max_dist(score_a, score_c, score_g, score_t)
  if score_a[0] > (score_c[0] and score_g[0] and score_t[0])
    return score_a
  end
end









