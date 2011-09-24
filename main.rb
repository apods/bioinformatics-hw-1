require "./lib/dna"
require "./lib/proj_math"

def real_ans # for input 5
  "CAAATGCGTACTATCTCGTATCAAT"
end

def calculate(dna, counter)
  if counter == 0
    return nil.to_s
  end
  
  return minimum("A" + calculate(dna, counter - 1), "C" + calculate(dna,
    counter - 1), "G" + calculate(dna, counter - 1),
    "T" + calculate(dna, counter-1))   
end

filename = "./test_cases/" + (ARGV.first || "input1.txt")
puts "Opening " + filename + "..."
dna = DNA.new(filename)


opt = calculate dna, dna.line_length















