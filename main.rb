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
    else
      return $current_best
    end
  end
  if max_dist < $current_best[0]
    nTide = majority(dna.column(dna.line_length - counter), dna.num_lines)
    if !nTide.nil?
      return calculate(dna, string + nTide, counter - 1)
    else
      cono = dna.line_length - counter
      puts has(dna.column(cono), "A")
      
      # Only bother moving down a tree if it actually has a nucleotide in the
      # next column.  At the very least it is possible to choose at least
      # one strand that will not have its distance increased.
      if has(dna.column(cono), "A")
        a_ans = calculate(dna, string + "A", counter - 1)
      end
      if has(dna.column(cono), "C")
        c_ans = calculate(dna, string + "C", counter - 1)
      end
      if has(dna.column(cono), "G")
        g_ans = calculate(dna, string + "G", counter - 1)
      end
      if has(dna.column(cono), "T")
        t_ans = calculate(dna, string + "T", counter - 1)
      end
      
      sequences = Array.new
      if !a_ans.nil?
        sequences << a_ans
      end
      if !c_ans.nil?
        sequences << c_ans
      end
      if !g_ans.nil?
        sequences << g_ans
      end
      if !t_ans.nil?
        sequences << t_ans
      end
      #return the least of these values
      if !sequences.empty?
        return min_sequence(sequences)
      else
        return $current_best
      end
    end
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


print_current_best

start_time  = Time.now.to_s
puts run(dna)
puts "Began at: " + start_time
puts "Ended at: " + Time.now.to_s








