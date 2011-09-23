require "./lib/dna"
require "./lib/column_score"

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

def total_distance(v, dna)
  return nil unless v.length == dna.line_size
  distance = 0
  strands = dna.all_strands
  strands.each_index do |i|
    distance += hamming_distance(v, strands[i])
  end
  distance
end

def alberto_total_distance(v, dna)
  return nil unless v.length == dna.line_size
  distance = 0
  c_dist = 0
  strands = dna.all_strands
  strands.each_index do |i|
    c_dist = hamming_distance(v, strands[i])
    if c_dist > distance
      distance = c_dist
    end
  end
  distance
end

def decide(column, num_lines)
  cs = ColumnScore.new
  for i in 0 .. num_lines
    if column[i] == ?A
      cs.inc_a
    elsif column[i] == ?C
      cs.inc_c
    elsif column[i] == ?G
      cs.inc_g
    elsif column[i] == ?T
      cs.inc_t
    end
  end
  cs.current_best[0]
end

filename = "./test_cases/" + (ARGV.first || "input1.txt")
puts "Opening " + filename + "..."
dna = DNA.new(filename)

opt = String.new
size = dna.line_size
for i in 0 .. size - 1
  opt += decide(dna.column(i), dna.num_lines)
end
puts opt
puts total_distance(opt, dna)
puts alberto_total_distance(opt, dna)












