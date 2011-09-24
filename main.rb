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

$current_worst = nil

def calculate(dna, string, counter)
  if counter == 0
    return Array.[](nil)
  elsif 
    calculate(dna, string + "A", counter - 1)
    calculate(dna, string + "C", counter - 1)
    calculate(dna, string + "G", counter - 1)
    calculate(dna, string + "T", counter - 1)
  else
    return nil
  end
end

filename = "./test_cases/" + (ARGV.first || "input1.txt")
puts "Opening " + filename + "..."
dna = DNA.new(filename)

#list = calculate dna, dna.line_length













