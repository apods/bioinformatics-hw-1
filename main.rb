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
  for i in 0 .. num_lines - 1
    nucleotide = column[i].chr
    if column[i] == ?A
      cs.inc_a
    elsif column[i] == ?C
      cs.inc_c
    elsif column[i] == ?G
      cs.inc_g
    elsif column[i] == ?T
      cs.inc_t
    elsif column[i]
      puts "Unrecognized char!\n"
    end
  end
  cs.current_best[0]
end

def real_ans
  "CAAATGCGTACTATCTCGTATCAAT"
end

filename = "./test_cases/" + (ARGV.first || "input1.txt")
puts "Opening " + filename + "..."
dna = DNA.new(filename)

opt = String.new
size = dna.line_size
for i in 0 .. size - 1
  opt += decide(dna.column(i), dna.num_lines)
end
#opt = decide(dna.column(23), dna.num_lines)
opt = "CAAACGCGTACTTTCTCTTATCACT"
puts dna.column(23)
puts "Mine: " + opt
puts "His:  " + String.new(real_ans[23].chr)
puts total_distance(opt, dna)
puts "My dist: " + alberto_total_distance(opt, dna).to_s
puts total_distance("CAAATGCGTACTATCTCGTATCAAT", dna)


#Mine CAAACGCGTA G TTTCTCTTATCACT
#His  CAAATGCGTA C TATCTCGTATCAAT







