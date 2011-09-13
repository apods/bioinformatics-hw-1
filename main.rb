class DNA
  def initialize(file)
    #read every line in the file
    @dna = IO.readlines(file)
    
    #get individual sizes
    @sizes = @dna[0].split
    
    #convert sizes into an integer
    @sizes.each_index do |i|
      @sizes[i] = @sizes[i].to_i
    end
    
    @dna = @dna[1, num_lines]
    @dna.each_index do |i|
      @dna[i] = @dna[i].chomp
    end
  end
  
  #return the number of DNA strands
  def num_lines
    @sizes[0]
  end
  
  #return the size of each line
  def line_size
    @sizes[1]
  end
  
  #print the DNA strands
  def print
    puts @dna
  end
  
  def all_strands
    @dna
  end
  
  def strand(i)
    @dna[i]
  end
  
  def column(i)
    #implement
  end
end

class ColumnScore
  attr_accessor :A, :C, :G, :T, :min_dist, :current_best
  def initialize
    @A = 0
    @C = 0
    @G = 0
    @T = 0
    @min_dist = 0
    @current_best = nil
  end
end

def hamming_distance(v, w)
  v_arr = v.split("")
  w_arr = w.split("")
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

def decide(column)
  
end

filename = ARGV.first || "input1.txt"
puts "Opening " + filename + "..."
dna = DNA.new(filename)


puts dna.all_strands












