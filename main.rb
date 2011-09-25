$LOAD_PATH << './lib'
require "dna"
require "proj_math"
require "column_score"
require "first_best"

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
  fp = File.new("BESTS.txt", "w")
    fp.puts "New current best: " + $current_best[1]
    fp.puts "At Distance: " + $current_best[0].to_s + "\n"
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
      print_current_best
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

best = first_best(dna)
$current_best[0] = best[0]
$current_best[1] = best[1]

#list = calculate dna, dna.line_length

start_time  = Time.now.to_s
puts run(dna)
puts "Began at: " + start_time
puts "Ended at: " + Time.now.to_s










