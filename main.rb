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

def print_error(string)
  fp = File.new("ERROR.txt", "w")
    fp.puts string
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
      return Array.[](max_dist, string)
    end
  end
  if max_dist < $current_best[0]
    nTide = majority(dna.column(dna.line_length - counter), dna.num_lines)
    if !nTide.nil?
      return calculate(dna, string + nTide, counter - 1)
    else
    
      a_ans = calculate(dna, string + "A", counter - 1)
      c_ans = calculate(dna, string + "C", counter - 1)
      g_ans = calculate(dna, string + "G", counter - 1)
      t_ans = calculate(dna, string + "T", counter - 1)
      
      #return the least of these values
      return min_sequence(Array.[](a_ans, c_ans, g_ans, t_ans))
    #end
  else
    return $current_best
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
print_current_best

start_time  = Time.now.to_s
puts run(dna)
puts "Began at: " + start_time
puts "Ended at: " + Time.now.to_s








