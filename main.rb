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
    puts @dna[1, num_lines]
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


file = ARGV.first || "input1.txt"
dna = DNA.new(file)
dna.print
puts hamming_distance("a", "a")





















