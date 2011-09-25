$LOAD_PATH << './lib'
require "dna"
require "proj_math"

def real_ans # for input 5
  "CAAATGCGTACTATCTCGTATCAAT"
end

def my_ans
  "CAAACGCTAGTTTCTCTTATCACT"
end

def append(array)
  array_length = array.length
  for i in 0 .. array_length - 1
    string = array[i].to_s
    array[i] = "A" + array[i].to_s
    array << "C" + string
    array << "G" + string
    array << "T" + string    
  end
  array
end

$current_best = Array.[](nil, "")

def print_current_best
  fp = File.open("BESTS.txt", "w")
    fp.puts "New current best: " + string
    fp.puts "At Distance: " + max_dist.to_s + "\n"
  fp.close
end

def calculate(dna, string, counter)
  puts "At level " + counter.to_s
  puts "Current string: " + string
  max_dist = max_distance(string, dna)
  if counter == 0
    if max_dist < $current_best[0]
      $current_best[0] = max_dist
      $current_best[1] = string
      return Array.[](string, max_dist)
    end
  end
  if max_dist < $current_best[0]
    a_ans = calculate(dna, string + "A", counter - 1)
    c_ans = calculate(dna, string + "C", counter - 1)
    g_ans = calculate(dna, string + "G", counter - 1)
    t_ans = calculate(dna, string + "T", counter - 1)
    
    #return the least of these values
    return min_sequence(Array.[](a_ans, c_ans, g_ans, t_ans))
  else
    return Array.[]("", dna.line_length + 1)
  end
end

def run(dna)
  calculate(dna, "", dna.line_length)
end

filename = "./test_cases/" + (ARGV.first || "input1.txt")
puts "Opening " + filename + "..."
dna = DNA.new(filename)

$current_best[0] = dna.line_length + 1

#list = calculate dna, dna.line_length

puts run(dna)










